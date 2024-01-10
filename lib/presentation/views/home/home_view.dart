import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/presentation/providers/providers.dart';
import 'package:teachersguard/presentation/widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Column(
      children: [
        HeaderHome(
          name: user.name,
          imageUrl: user.imageProfile,
        ),
        Flexible(
          child: ListView.separated(
              itemCount: 2,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              itemBuilder: (context, index) => const ClassBox(
                    classLabel: 'Clase Actual',
                    classRoomLabel: 'Salon 303',
                    hourLabel: '10:00-11:00',
                  )),
        )
      ],
    );
  }
}
