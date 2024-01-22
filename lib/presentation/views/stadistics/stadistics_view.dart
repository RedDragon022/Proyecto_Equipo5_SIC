import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:teachersguard/presentation/providers/place/place_list_provider.dart';
import 'package:teachersguard/presentation/providers/place/week_use_place_provider.dart';
import 'package:teachersguard/presentation/widgets/widgets.dart';

import '../../../domain/entities/entities.dart';

class StadisticsView extends ConsumerWidget {
  const StadisticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    final titleStyle =
        textStyle.displaySmall?.copyWith(fontWeight: FontWeight.w600);

    ref.watch(placeListProvider.notifier).getAllPlaces();

    final isLoading = ref.watch(placeListProvider.notifier).isLoading;

    final places = ref.watch(placeListProvider);

    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Text('Estadísticas', style: titleStyle),
            const SizedBox(height: 20),
            (isLoading)
                ? SizedBox(
                    height: deviceHeight / 2,
                    child: Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                          color: primaryColor, size: 100),
                    ),
                  )
                : _WidgetsLoaded(
                    places: places, sizeBoxHeight: deviceHeight / 4)
          ],
        ));
  }
}

class _WidgetsLoaded extends ConsumerWidget {
  const _WidgetsLoaded({required this.places, required this.sizeBoxHeight});

  final List<Place> places;
  final double sizeBoxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     final place = ref.watch(weekUsePlaceProvider);
    return Column(
      children: [
        CustomDropdownButton(
            items: places.map((place) => place.name).toList(),
            onChanged: (value) {
              final place =
                  places.firstWhere((place) => place.name.contains(value));
              ref
                  .read(weekUsePlaceProvider.notifier)
                  .getWeekUsePlaceByPlaceId(place.id);
            }),
        SizedBox(height: sizeBoxHeight),
        CustomCircularProgressIndicator(
          counter: place.counter,
          total:  place.total,
          label: 'Porcentaje de uso semanal',
        )
      ],
    );
  }
}
