import 'package:flutter/cupertino.dart';

import '../../views.dart';

class UserScheduleView extends StatefulWidget {
  const UserScheduleView({super.key});

  @override
  State<UserScheduleView> createState() => _UserScheduleViewState();
}

class _UserScheduleViewState extends State<UserScheduleView> {
  
  int? sliding = 0;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CustomSlidingSegmentedControl(
          index: sliding,
          onValueChanged: (index) {
            setState(() {
              sliding = index;
            });
          },
        ),
        const SizedBox(height: 20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sliding == 0 ? ScheduleView() : AttendanceView(),
        ),
      ],
    );
  }
}

class _CustomSlidingSegmentedControl extends StatelessWidget {
  const _CustomSlidingSegmentedControl({required this.onValueChanged, required this.index});

  final void Function(int?) onValueChanged;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        children: const {0: Text('Horario'), 1: Text('Asistencias')},
        groupValue: index,
        onValueChanged: onValueChanged,
      ),
    );
  }
}
