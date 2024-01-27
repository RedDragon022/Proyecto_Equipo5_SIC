import 'dart:convert';
import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teachersguard/infraestructure/services/pdf/pdf_service.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../domain/entities/entities.dart';

class PDFUseCase {
  final PDFService _pdfService;

  PDFUseCase(this._pdfService);

  Future<void> createStadisticsPDF(
      List<Place> places, List<WeekUsePlace> weekUsePlace) async {
    var savedFile = await _pdfService.createStatisticsPDF(places, weekUsePlace);
    if (kIsWeb) {
      List<int> fileInts = List.from(savedFile);
      html.AnchorElement(
          href:
              "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
        ..setAttribute("download", "estadisticas_salones.pdf")
        ..click();
    } else {
      final output = await getDownloadsDirectory();
      final path = "${output?.path}/estadisticas_salones.pdf";
      final file = File(path);

      await file.writeAsBytes(savedFile);
      await OpenFile.open(path);
    }
  }
}
