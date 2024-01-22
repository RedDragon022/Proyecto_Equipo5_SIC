import 'package:teachersguard/domain/entities/entities.dart';

import '../models/models.dart';

class PlaceMapper {
  static Place mapPlaceResponseToPlaceEntity(PlaceResponse placeResponse) =>
      Place(id: placeResponse.id, name: placeResponse.name);
}
