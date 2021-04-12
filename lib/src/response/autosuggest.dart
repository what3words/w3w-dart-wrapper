import 'package:json_annotation/json_annotation.dart';
import 'package:what3words/src/response/coordinates.dart';

part 'autosuggest.g.dart';

///Encapulates AutoSuggest suggestions
@JsonSerializable(explicitToJson: true)
class Autosuggest {
  List<Suggestion> suggestions;

  Autosuggest({required this.suggestions});

  factory Autosuggest.fromJson(Map<String, dynamic> json) =>
      _$AutosuggestFromJson(json);

  Map<String, dynamic> toJson() => _$AutosuggestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Suggestion {
  String country;
  String nearestPlace;
  String words;
  int? distanceToFocusKm;
  int rank;
  String language;

  Suggestion(
      {required this.country,
      required this.nearestPlace,
      required this.words,
      this.distanceToFocusKm,
      required this.rank,
      required this.language});

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);
}

///Encapulates AutoSuggest suggestions
@JsonSerializable(explicitToJson: true)
class AutosuggestWithCoordinates {
  List<SuggestionWithCoordinates> suggestions;

  AutosuggestWithCoordinates({required this.suggestions});

  factory AutosuggestWithCoordinates.fromJson(Map<String, dynamic> json) =>
      _$AutosuggestWithCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$AutosuggestWithCoordinatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SuggestionWithCoordinates {
  String country;
  String nearestPlace;
  String words;
  CoordinatesResponse coordinates;
  int? distanceToFocusKm;
  int rank;
  String language;

  SuggestionWithCoordinates(
      {required this.country,
      required this.nearestPlace,
      required this.words,
      required this.coordinates,
      this.distanceToFocusKm,
      required this.rank,
      required this.language});

  factory SuggestionWithCoordinates.fromJson(Map<String, dynamic> json) =>
      _$SuggestionWithCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionWithCoordinatesToJson(this);
}
