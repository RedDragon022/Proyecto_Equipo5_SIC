import 'package:teachersguard/domain/datasources/datasources.dart';
import 'package:teachersguard/domain/entities/place.dart';
import 'package:teachersguard/domain/entities/week_use_place.dart';

import '../../../domain/repositories/repositories.dart';

class PlaceRepositoryImpl extends PlaceRepository {
  final PlaceDatasource _placeDatasource;

  PlaceRepositoryImpl(this._placeDatasource);
  @override
  Future<List<Place>> fetchPlaces() {
    return _placeDatasource.fetchPlaces();
  }

  @override
  Future<WeekUsePlace> fetchUsePlace(String placeId) {
    return _placeDatasource.fetchUsePlace(placeId);
  }
}
