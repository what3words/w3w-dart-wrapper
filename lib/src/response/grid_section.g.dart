// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridSection _$GridSectionFromJson(Map<String, dynamic> json) {
  return GridSection(
    lines: (json['lines'] as List)
        ?.map(
            (e) => e == null ? null : Line.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GridSectionToJson(GridSection instance) =>
    <String, dynamic>{
      'lines': instance.lines?.map((e) => e?.toJson())?.toList(),
    };

Line _$LineFromJson(Map<String, dynamic> json) {
  return Line(
    start: json['start'] == null
        ? null
        : CoordinatesResponse.fromJson(json['start'] as Map<String, dynamic>),
    end: json['end'] == null
        ? null
        : CoordinatesResponse.fromJson(json['end'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'start': instance.start?.toJson(),
      'end': instance.end?.toJson(),
    };
