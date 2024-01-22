import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/useCases/place/place_use_case.dart';

final placeListProvider =
    StateNotifierProvider<PlaceListNotifier, List<Place>>((ref) {
  return PlaceListNotifier(placeUseCase);
});

class PlaceListNotifier extends StateNotifier<List<Place>> {
  final PlaceUseCase _placeUseCase;
  PlaceListNotifier(this._placeUseCase) : super([]);

  Future<void> getAllPlaces() async {
    try {
      state = await _placeUseCase.getAllPlaces();
    } on PlaceException catch (_) {
      state = [];
    }
  }
}
