import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceUserView extends StatelessWidget {
  const AttendanceUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {'Columna1': 'Dato1', 'Columna2': 'Dato2', 'Columna3': 'Dato3'},
      {'Columna1': 'Dato4', 'Columna2': 'Dato5', 'Columna3': 'Dato6'},
      // Agrega más datos según sea necesario
    ];

    final textStyleContext = Theme.of(context).textTheme;

    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
        fontSize: textStyleContext.labelLarge?.fontSize,
        fontWeight: FontWeight.w600);

    final classLabelStyle = textFont.copyWith(
        fontSize: textStyleContext.labelLarge?.fontSize,
        fontStyle: FontStyle.italic);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          dataRowMaxHeight: 80,
          columns: [
            DataColumn(label: Text('Clases', style: titleStyle)),
            DataColumn(label: Text('Entrada', style: titleStyle)),
            DataColumn(label: Text('Salida', style: titleStyle)),
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) => DataRow(
              cells: [
                DataCell(Text(data[index]['Columna1'].toString(),
                    style: classLabelStyle)),
                DataCell(_AttendanceCell(label: data[index]['Columna2'].toString())),
                DataCell(_AttendanceCell(label: data[index]['Columna3'].toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AttendanceCell extends StatelessWidget {
  const _AttendanceCell({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green.shade400,
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
