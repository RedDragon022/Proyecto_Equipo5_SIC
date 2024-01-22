import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/presentation/providers/place/place_list_provider.dart';

class StadisticsView extends ConsumerWidget {
  const StadisticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;

    final titleStyle =
        textStyle.displaySmall?.copyWith(fontWeight: FontWeight.w600);

    ref.watch(placeListProvider.notifier).getAllPlaces();

    final places = ref.read(placeListProvider);

    print(places.length);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text('Estadísticas', style: titleStyle),
          const SizedBox(height: 20),
          _CustomDropdownButton(
            items: places.map((place) => place.name).toList(),
          ),
        ],
      ),
    );
  }
}

class _CustomDropdownButton extends StatelessWidget {
  const _CustomDropdownButton({
    this.items,
    this.onChanged,
  });

  // Lista de elementos para el dropdown
  final List<String>? items;
  final dynamic Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final decoration = CustomDropdownDecoration(
        closedFillColor: Colors.grey.shade300,
        expandedFillColor: Colors.grey.shade100,
        hintStyle: textStyle.labelLarge
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500));

    return CustomDropdown<String>(
      hintText: 'Seleccione un aula',
      decoration: decoration,
      items: items,
      onChanged: onChanged,
    );
  }
}
