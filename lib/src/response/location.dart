import 'package:json_annotation/json_annotation.dart';

import 'coordinates.dart';
import 'response.dart';
part 'location.g.dart';

/// Encapsulates a what3words location
@JsonSerializable(explicitToJson: true)
class Location extends Response<Location> {
  String country;
  Square square;
  String nearestPlace;
  CoordinatesResponse coordinates;
  String words;
  String language;
  String map;

  Location(
      {this.country,
      this.square,
      this.nearestPlace,
      this.coordinates,
      this.words,
      this.language,
      this.map});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// A what3words square
@JsonSerializable(explicitToJson: true)
class Square {
  CoordinatesResponse southwest;
  CoordinatesResponse northeast;

  Square({this.southwest, this.northeast});

  factory Square.fromJson(Map<String, dynamic> json) => _$SquareFromJson(json);

  Map<String, dynamic> toJson() => _$SquareToJson(this);
}
