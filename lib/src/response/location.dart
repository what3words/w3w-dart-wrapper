import 'coordinates.dart';

/// Encapsulates a what3words location
class Location {
  String country;
  Square square;
  String nearestPlace;
  CoordinatesResponse coordinates;
  String words;
  String language;
  String map;
  String? locale; // Add the locale field, which can be null

  Location(
      {required this.country,
      required this.square,
      required this.nearestPlace,
      required this.coordinates,
      required this.words,
      required this.language,
      required this.map,
      this.locale}); // Add locale to the constructor as an optional parameter

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// A what3words square
class Square {
  CoordinatesResponse southwest;
  CoordinatesResponse northeast;

  Square({required this.southwest, required this.northeast});

  factory Square.fromJson(Map<String, dynamic> json) => _$SquareFromJson(json);

  Map<String, dynamic> toJson() => _$SquareToJson(this);
}

// toJson, fromJson

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    country: json['country'] as String,
    square: Square.fromJson(json['square'] as Map<String, dynamic>),
    nearestPlace: json['nearestPlace'] as String,
    coordinates: CoordinatesResponse.fromJson(
        json['coordinates'] as Map<String, dynamic>),
    words: json['words'] as String,
    language: json['language'] as String,
    map: json['map'] as String,
    locale: json['locale'] as String?,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'country': instance.country,
      'square': instance.square.toJson(),
      'nearestPlace': instance.nearestPlace,
      'coordinates': instance.coordinates.toJson(),
      'words': instance.words,
      'language': instance.language,
      'map': instance.map,
      if (instance.locale != null) 'locale': instance.locale,
    };

Square _$SquareFromJson(Map<String, dynamic> json) {
  return Square(
    southwest:
        CoordinatesResponse.fromJson(json['southwest'] as Map<String, dynamic>),
    northeast:
        CoordinatesResponse.fromJson(json['northeast'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SquareToJson(Square instance) => <String, dynamic>{
      'southwest': instance.southwest.toJson(),
      'northeast': instance.northeast.toJson(),
    };
