// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
