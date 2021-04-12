import 'package:json_annotation/json_annotation.dart';
part 'coordinates.g.dart';

/// A response coordinates
@JsonSerializable(explicitToJson: true)
class CoordinatesResponse {
  double lng;
  double lat;

  CoordinatesResponse({required this.lng, required this.lat});

  factory CoordinatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesResponseToJson(this);
}
