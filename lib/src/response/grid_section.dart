import 'coordinates.dart';

/// A section of the what3words grid
class GridSection {
  List<Line> lines;

  GridSection({required this.lines});

  factory GridSection.fromJson(Map<String, dynamic> json) =>
      _$GridSectionFromJson(json);

  Map<String, dynamic> toJson() => _$GridSectionToJson(this);
}

/// A section of grid line defined by to points
class Line {
  CoordinatesResponse start;
  CoordinatesResponse end;

  Line({required this.start, required this.end});

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  Map<String, dynamic> toJson() => _$LineToJson(this);
}

//toJson(), fromJson()
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
