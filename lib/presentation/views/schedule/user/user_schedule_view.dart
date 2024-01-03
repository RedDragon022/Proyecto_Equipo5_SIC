import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views.dart';

class UserScheduleView extends StatelessWidget {
  const UserScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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

    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        children: const {0: Text('Horario'), 1: Text('Asistencias')},
        groupValue: _sliding,
        onValueChanged: (index) {
          setState(() {
            _sliding = index;
            getCurrentView(_sliding);
          });
        },
      ),
    );
  }
}
