import 'package:flutter/material.dart';
import 'package:teachersguard/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderHome(
          name: 'Wongyoung',
          imageUrl:
              'https://th.bing.com/th/id/OIP.gGnxYwfTCN_kNeabccBLKwHaJQ?rs=1&pid=ImgDetMain',
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
