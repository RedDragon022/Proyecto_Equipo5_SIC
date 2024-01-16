import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersguard/config/helpers/date_helper.dart';
import 'package:teachersguard/presentation/providers/providers.dart';

class AttendanceUserView extends ConsumerWidget {
  const AttendanceUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleContext = Theme.of(context).textTheme;

    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
        fontSize: textStyleContext.labelLarge?.fontSize,
        fontWeight: FontWeight.w600);

    final textStyle = textFont.copyWith(
        fontSize: textStyleContext.labelLarge?.fontSize,
        fontStyle: FontStyle.italic);

    ref.watch(attendanceListProvider.notifier).getAttendancesByUserId();

    final attendances =
        ref.watch(attendanceListProvider); //TODO : MEJORAR TEMA DE PERFORMANCE

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
          rows: List<DataRow>.generate(attendances.length, (index) {
            final entryDate = attendances[index].entryDate;

            final exitDate = attendances[index].exitDate;

            final place = attendances[index].place;

            final isAttedanceCompleted = attendances[index].isAttendanceCompleted;

            return DataRow(
              cells: [
                DataCell(_ClassCell(
                    title: place.name,
                    subtitle: DateHelper.convertDateTimeToDateTimeOnly(entryDate),
                    textStyle: textStyle)),
                DataCell(_AttendanceCell(
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade400,
                    ),
                    label: DateHelper.convertTo12HourFormat(entryDate))),
                DataCell(_AttendanceCell(
                    icon: (isAttedanceCompleted) ? Icon(
                      Icons.check_circle,
                      color: Colors.green.shade400,
                    ): const Icon(Icons.cancel, color: Colors.red),
                    label: DateHelper.convertTo12HourFormat(exitDate))),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _ClassCell extends StatelessWidget {
  const _ClassCell({
    this.textStyle, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Text(title, style: textStyle),
        const SizedBox(height: 5),
        Text(subtitle, style: textStyle)
      ],
    );
  }
}

class _AttendanceCell extends StatelessWidget {
  const _AttendanceCell({required this.label, required this.icon});

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
