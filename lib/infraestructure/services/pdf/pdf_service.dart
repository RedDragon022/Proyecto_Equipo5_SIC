import 'dart:typed_data';

import '../../../domain/entities/entities.dart';

abstract class PDFService {
  Future<Uint8List> createStatisticsPDF(List<Place> places);
}
