import 'package:json_annotation/json_annotation.dart';
import 'package:what3words/src/response/response.dart';

import 'coordinates.dart';
part 'grid_section.g.dart';

/// A section of the what3words grid
@JsonSerializable(explicitToJson: true)
class GridSection extends Response<GridSection> {
  List<Line> lines;

  GridSection({this.lines});

  factory GridSection.fromJson(Map<String, dynamic> json) =>
      _$GridSectionFromJson(json);

  Map<String, dynamic> toJson() => _$GridSectionToJson(this);
}

/// A section of grid line defined by to points
@JsonSerializable(explicitToJson: true)
class Line {
  CoordinatesResponse start;
  CoordinatesResponse end;

  Line({this.start, this.end});

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  Map<String, dynamic> toJson() => _$LineToJson(this);
}
