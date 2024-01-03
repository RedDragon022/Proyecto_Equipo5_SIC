import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:teachersguard/presentation/views/schedule/attendance_view.dart';

class UserScheduleView extends StatelessWidget {
  const UserScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CustomSlidingSegmentedControl(),
        const SizedBox(height: 20),
        AttendanceView()
      ],
    );
  }
}

class _CustomSlidingSegmentedControl extends StatefulWidget {
  const _CustomSlidingSegmentedControl();

  @override
  State<_CustomSlidingSegmentedControl> createState() =>
      _CustomSlidingSegmentedControlState();
}

class _CustomSlidingSegmentedControlState
    extends State<_CustomSlidingSegmentedControl> {
  int? _sliding = 0;

  void getCurrentView(int? index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey
    );

    return CustomSlidingSegmentedControl(
      fixedWidth: deviceWidth / 3,
      decoration: decoration,
      thumbDecoration: decoration.copyWith(color: Colors.white),
      children: const {0: Text('Horario'), 1: Text('Asistencias')},
      initialValue: _sliding,
      onValueChanged: (index) {
        setState(() {
          _sliding = index;
          getCurrentView(_sliding);
        });
      },
    );
  }
}
