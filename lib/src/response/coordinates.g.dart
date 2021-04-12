// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesResponse _$CoordinatesResponseFromJson(Map<String, dynamic> json) {
  return CoordinatesResponse(
    lng: (json['lng'] as num).toDouble(),
    lat: (json['lat'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesResponseToJson(
        CoordinatesResponse instance) =>
    <String, dynamic>{
      'lng': instance.lng,
      'lat': instance.lat,
    };
