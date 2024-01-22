import 'package:teachersguard/domain/repositories/repositories.dart';

import '../../domain/entities/entities.dart';

class PlaceUseCase {
  final PlaceRepository _placeRepository;

  PlaceUseCase(this._placeRepository);

  Future<List<Place>> getAllPlaces() {
    return _placeRepository.fetchPlaces();
  }

  Future<WeekUsePlace> getUsePlaceByPlaceId(String placeId) {
    return _placeRepository.fetchUsePlace(placeId);
  }
}
