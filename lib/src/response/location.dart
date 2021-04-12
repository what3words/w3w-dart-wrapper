import 'package:json_annotation/json_annotation.dart';

import 'coordinates.dart';
part 'location.g.dart';

/// Encapsulates a what3words location
@JsonSerializable(explicitToJson: true)
class Location {
  String country;
  Square square;
  String nearestPlace;
  CoordinatesResponse coordinates;
  String words;
  String language;
  String map;

  Location(
      {required this.country,
      required this.square,
      required this.nearestPlace,
      required this.coordinates,
      required this.words,
      required this.language,
      required this.map});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// A what3words square
@JsonSerializable(explicitToJson: true)
class Square {
  CoordinatesResponse southwest;
  CoordinatesResponse northeast;

  Square({required this.southwest, required this.northeast});

  factory Square.fromJson(Map<String, dynamic> json) => _$SquareFromJson(json);

  Map<String, dynamic> toJson() => _$SquareToJson(this);
}
