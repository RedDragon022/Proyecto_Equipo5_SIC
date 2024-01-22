import 'package:teachersguard/domain/entities/entities.dart';

abstract class PlaceDatasource {
  Future<List<Place>> fetchPlaces();
  Future<WeekUsePlace> fetchUsePlace(String placeId);
}
