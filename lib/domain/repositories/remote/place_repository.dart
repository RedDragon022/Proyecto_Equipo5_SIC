import '../../entities/entities.dart';

abstract class PlaceRepository{
  Future<List<Place>> fetchPlaces(); 
  Future<WeekUsePlace> fetchUsePlace(String placeId);
}