import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:teachersguard/config/helpers/date_helper.dart';
import 'package:teachersguard/infraestructure/services/pdf/pdf_service.dart';

import 'package:pdf/widgets.dart' as pw;

import '../../../domain/entities/entities.dart';

class PDFServiceImpl extends PDFService {
  final _pdf = pw.Document();

  @override
  Future<Uint8List> createStatisticsPDF(List<Place> places) async {
    // Utiliza una fuente de Google que admita caracteres Unicode
    final font =
        await rootBundle.load("lib/assets/fonts/poppins/Poppins-Regular.ttf");
    final ttf = pw.Font.ttf(font);

    final img = await rootBundle.load('lib/assets/icon/icon.jpg');
    final imageBytes = img.buffer.asUint8List();

    final textStyle = pw.TextStyle(font: ttf);
    final primaryColor = PdfColor.fromHex('#B356FF');

    _pdf.addPage(
      pw.Page(build: (pw.Context context) {
        final decoration = pw.BoxDecoration(
            color: PdfColors.black, borderRadius: pw.BorderRadius.circular(10));
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(children: [
                pw.Image(
                  pw.MemoryImage(imageBytes),
                  width: 60,
                  height: 60,
                ),
                pw.SizedBox(width: 10),
                pw.Text('TeachersGuard',
                    style: textStyle.copyWith(
                        fontWeight: pw.FontWeight.bold, fontSize: 15)),
              ]),
              pw.SizedBox(height: 10),
              pw.Text(
                  'Registro de uso promedio de todos los salones disponibles',
                  style: textStyle),
              pw.Text('Fecha de emisión: ${DateHelper.formatCurrentDatePDF()}',
                  style: textStyle),
              pw.SizedBox(height: 10),
              pw.ListView.separated(
                  itemBuilder: (context, index) => pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                                decoration: decoration,
                                width: double.infinity,
                                height: 20,
                                alignment: pw.Alignment.center,
                                child: pw.Text(places[index].name,
                                    style: textStyle.copyWith(
                                        color: PdfColors.white))),
                            pw.SizedBox(height: 10),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                              pw.Stack(
                                  alignment: pw.Alignment.center,
                                  children: [
                                    pw.SizedBox(
                                      width: 120.0,
                                      height: 120.0,
                                      child: pw.CircularProgressIndicator(
                                          strokeWidth: 4,
                                          value: 0,
                                          backgroundColor: PdfColors.grey,
                                          color: primaryColor),
                                    ),
                                    pw.Text('50%', style: textStyle)
                                  ]),
                              pw.SizedBox(width: 50),
                              pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                pw.SizedBox(height: 10),
                                pw.Text('Total de asistencias hechas: ', style: textStyle),
                                pw.SizedBox(height: 5),
                                pw.Text('Total de asistencias registradas: ', style: textStyle)
                              ])
                            ]),
                          ]),
                  separatorBuilder: (context, index) => pw.SizedBox(height: 10),
                  itemCount: places.length)
            ]);
      }),
    );

    return _pdf.save();
  }
}
