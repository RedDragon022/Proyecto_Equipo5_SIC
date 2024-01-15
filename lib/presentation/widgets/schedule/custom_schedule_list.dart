import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teachersguard/config/helpers/date_helper.dart';

import '../../../domain/entities/entities.dart';

class CustomScheduleList extends StatelessWidget {
  const CustomScheduleList({
    super.key,
    required this.schedules,
    this.titleStyle,
    this.subtitleStyle,
    this.containerTextStyle,
  });

  final List<Schedule> schedules;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? containerTextStyle;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final currentSchedule = schedules[index];

        return CupertinoListTile(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          title: Text(DateHelper.convertTo12HourFormat(currentSchedule.begin),
              style: titleStyle),
          subtitle: Text(DateHelper.convertTo12HourFormat(currentSchedule.end),
              style: subtitleStyle),
          additionalInfo: _ScheduleContainer(
            label: currentSchedule.place.name,
            textStyle: containerTextStyle,
            width: deviceWidth / 4,
            height: 90,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
            color: Color.fromARGB(255, 193, 193, 193), thickness: 4);
      },
      itemCount: schedules.length,
    );
  }
}

class _ScheduleContainer extends StatelessWidget {
  const _ScheduleContainer({
    this.textStyle,
    required this.label,
    this.width,
    this.height,
  });

  final TextStyle? textStyle;
  final String label;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        color: const Color(0xFFE2A6FF),
        borderRadius: BorderRadius.circular(10));
    return Container(
      decoration: decoration,
      alignment: Alignment.center,
      height: height ?? 100,
      width: width ?? 200,
      child: Text(label, style: textStyle, textAlign: TextAlign.center),
    );
  }
}
