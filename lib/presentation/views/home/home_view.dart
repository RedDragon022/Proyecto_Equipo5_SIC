import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final primaryColor = Theme.of(context).primaryColor;

    final user = ref.watch(userProvider);

    if (user.name.isEmpty) ref.read(userProvider.notifier).getLocalUserAuth();

    ref.read(weekAttendanceProvider.notifier).getWeekAttendanceByUserId();

    final weekAttendances = ref.watch(weekAttendanceProvider);

    final isLoading = ref.read(weekAttendanceProvider.notifier).isLoading;

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
                textStyle: textStyle),
      ],
    );
  }
}
