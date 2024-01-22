import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/domain/entities/entities.dart';

import '../../../useCases/use_cases.dart';

final weekUsePlaceProvider =
    StateNotifierProvider.autoDispose<WeekUsePlaceNotifier, WeekUsePlace>((ref) {
  return WeekUsePlaceNotifier(placeUseCase);
});

class WeekUsePlaceNotifier extends StateNotifier<WeekUsePlace> {
  final PlaceUseCase _placeUseCase;
  WeekUsePlaceNotifier(this._placeUseCase) : super(WeekUsePlace());

  Future<void> getWeekUsePlaceByPlaceId(String placeId) async {
    try {
      state = await _placeUseCase.getUsePlaceByPlaceId(placeId);
      print(state.total);
    } catch (_) {
      state = WeekUsePlace();
    }
  }
}
