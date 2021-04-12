// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridSection _$GridSectionFromJson(Map<String, dynamic> json) {
  return GridSection(
    lines: (json['lines'] as List<dynamic>)
        .map((e) => Line.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GridSectionToJson(GridSection instance) =>
    <String, dynamic>{
      'lines': instance.lines.map((e) => e.toJson()).toList(),
    };

Line _$LineFromJson(Map<String, dynamic> json) {
  return Line(
    start: CoordinatesResponse.fromJson(json['start'] as Map<String, dynamic>),
    end: CoordinatesResponse.fromJson(json['end'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'start': instance.start.toJson(),
      'end': instance.end.toJson(),
    };
