import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final primaryColor = Theme.of(context).primaryColor;

    final user = ref.watch(userProvider);

    final weekAttendances = ref.read(weekAttendanceProvider);

    final isLoading = ref.watch(weekAttendanceProvider.notifier).isLoading;

    ref.read(weekAttendanceProvider.notifier).getWeekAttendanceByUserId();

    final deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        HeaderHome(
          name: user.name,
          imageUrl: user.imageProfile,
        ),
        SizedBox(height: deviceHeight / 4),
        (isLoading)
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
