import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(weekAttendanceProvider.notifier).getWeekAttendanceByUserId();
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final primaryColor = Theme.of(context).primaryColor;
    final deviceHeight = MediaQuery.of(context).size.height;

    final user = ref.watch(userProvider);

    final weekAttendances = ref.watch(weekAttendanceProvider);
    

    return Column(
      children: [
        HeaderHome(
          name: user.name,
          imageUrl: user.imageProfile,
        ),
        SizedBox(height: deviceHeight / 4),
        (ref.read(weekAttendanceProvider.notifier).isLoading)
            ? LoadingAnimationWidget.fourRotatingDots(
                color: primaryColor,
                size: 100,
              )
            : CustomCircularProgressIndicator(
                counter: weekAttendances.attendances,
                total: weekAttendances.totalAttendances,
                label:
                    '${weekAttendances.attendances}/${weekAttendances.totalAttendances} Asistencias semanales',
                textStyle: textStyle),
      ],
    );
  }
}
