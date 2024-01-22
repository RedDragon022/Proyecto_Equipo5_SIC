import 'package:teachersguard/domain/entities/place.dart';
import 'package:teachersguard/infraestructure/datasources/remote/client/client.dart';
import 'package:teachersguard/infraestructure/mappers/place_mapper.dart';
import 'package:teachersguard/infraestructure/models/models.dart';

import '../../../domain/datasources/datasources.dart';
import '../../errors/errors.dart';

class PlaceDatasourceImpl extends PlaceDatasource {
  @override
  Future<List<Place>> fetchPlaces() async {
    try {
      final json = await client.get('/Place/get-places');

      if (json.statusCode != 200) {
        throw PlaceException(json.statusMessage!);
      }

      final response = PlacesResponse.fromJson(json.data);

      final places = response.places;

      return places.map(PlaceMapper.mapPlaceResponseToPlaceEntity).toList();
    } on PlaceException catch (e) {
      throw PlaceException(e.message);
    }
  }
}
