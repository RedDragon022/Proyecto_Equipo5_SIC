import 'package:flutter/material.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
      final List<Map<String, dynamic>> data = [
    {'Columna1': 'Dato1', 'Columna2': 'Dato2', 'Columna3': 'Dato3'},
    {'Columna1': 'Dato4', 'Columna2': 'Dato5', 'Columna3': 'Dato6'},
    // Agrega más datos según sea necesario
  ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Clases')),
          DataColumn(label: Text('Entrada')),
          DataColumn(label: Text('Salida')),
        ],
        rows: List<DataRow>.generate(
          data.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(data[index]['Columna1'].toString())),
              DataCell(Text(data[index]['Columna2'].toString())),
              DataCell(Text(data[index]['Columna3'].toString())),
            ],
          ),
        ),
      ),
    );
  }
}