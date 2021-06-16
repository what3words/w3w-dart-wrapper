
/// A response coordinates
class CoordinatesResponse {
  double lng;
  double lat;

  CoordinatesResponse({required this.lng, required this.lat});

  factory CoordinatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesResponseToJson(this);
}

//toJson and FromJson()
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
