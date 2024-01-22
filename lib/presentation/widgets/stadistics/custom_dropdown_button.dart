import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({super.key, 
    this.items,
    this.onChanged,
  });

  // Lista de elementos para el dropdown
  final List<String>? items;
  final Function(String)? onChanged;

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
