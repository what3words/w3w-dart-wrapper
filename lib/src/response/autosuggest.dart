import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
part 'autosuggest.g.dart';

///Encapulates AutoSuggest suggestions
@JsonSerializable(explicitToJson: true)
class Autosuggest extends Response<Autosuggest> {
  List<Suggestion> suggestions;

  Autosuggest({this.suggestions});

  factory Autosuggest.fromJson(Map<String, dynamic> json) =>
      _$AutosuggestFromJson(json);

  Map<String, dynamic> toJson() => _$AutosuggestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Suggestion {
  String country;
  String nearestPlace;
  String words;
  int distanceToFocusKm;
  int rank;
  String language;

  Suggestion(
      {this.country,
      this.nearestPlace,
      this.words,
      this.distanceToFocusKm,
      this.rank,
      this.language});

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);
}
