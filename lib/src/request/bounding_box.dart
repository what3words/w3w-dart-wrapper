import 'coordinate.dart';

/// Encapsulate a bounding box to be used in a request
class BoundingBox {
  final Coordinates sw;
  final Coordinates ne;

  BoundingBox(this.sw, this.ne);
}
