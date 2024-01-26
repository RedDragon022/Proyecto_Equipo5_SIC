import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/useCases/use_cases.dart';

final weekUsePlaceListProvider =
    StateNotifierProvider<WeekUsePlaceListNotifier, List<WeekUsePlace>>((ref) {
  return WeekUsePlaceListNotifier(placeUseCase);
});

class WeekUsePlaceListNotifier extends StateNotifier<List<WeekUsePlace>> {
  final PlaceUseCase _placeUseCase;
  WeekUsePlaceListNotifier(this._placeUseCase) : super([]);

  Future<void> getWeekUsePlaceList(List<Place> places) async {
    if (state.isNotEmpty) return;
    try {
      for (var place in places) {
        final data = await _placeUseCase.getUsePlaceByPlaceId(place.id);
        state = [...state, data];
      }
    } catch (_) {
      state = [...state];
    }
  }
}
