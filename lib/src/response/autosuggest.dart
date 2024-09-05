import 'package:what3words/src/response/coordinates.dart';

/// Encapsulates AutoSuggest suggestions
class Autosuggest {
  List<Suggestion> suggestions;

  Autosuggest({required this.suggestions});

  factory Autosuggest.fromJson(Map<String, dynamic> json) =>
      _$AutosuggestFromJson(json);

  Map<String, dynamic> toJson() => _$AutosuggestToJson(this);
}

/// A suggestion from the autosuggest API
class Suggestion {
  String country;
  String nearestPlace;
  String words;
  int? distanceToFocusKm;
  int rank;
  String language;
  String? locale;  // Locale can be null

  Suggestion(
      {required this.country,
      required this.nearestPlace,
      required this.words,
      this.distanceToFocusKm,
      required this.rank,
      required this.language,
      this.locale});  // Initialize locale

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() {
    // Logic for handling locale and language
    return {
      'country': country,
      'nearestPlace': nearestPlace,
      'words': words,
      'distanceToFocusKm': distanceToFocusKm,
      'rank': rank,
      'language': language,
      'locale': locale ?? language, // Use locale if available, otherwise fallback to language
    };
  }
}

/// Encapsulates AutoSuggest suggestions with coordinates
class AutosuggestWithCoordinates {
  List<SuggestionWithCoordinates> suggestions;

  AutosuggestWithCoordinates({required this.suggestions});

  factory AutosuggestWithCoordinates.fromJson(Map<String, dynamic> json) =>
      _$AutosuggestWithCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$AutosuggestWithCoordinatesToJson(this);
}

/// A suggestion with coordinates from the autosuggest API
class SuggestionWithCoordinates {
  String country;
  String nearestPlace;
  String words;
  CoordinatesResponse coordinates;
  int? distanceToFocusKm;
  int rank;
  String language;
  String? locale;  // Locale can be null

  SuggestionWithCoordinates(
      {required this.country,
      required this.nearestPlace,
      required this.words,
      required this.coordinates,
      this.distanceToFocusKm,
      required this.rank,
      required this.language,
      this.locale});  // Initialize locale

  factory SuggestionWithCoordinates.fromJson(Map<String, dynamic> json) =>
      _$SuggestionWithCoordinatesFromJson(json);

  Map<String, dynamic> toJson() {
    // Logic for handling locale and language
    return {
      'country': country,
      'nearestPlace': nearestPlace,
      'words': words,
      'coordinates': coordinates.toJson(),
      'distanceToFocusKm': distanceToFocusKm,
      'rank': rank,
      'language': language,
      'locale': locale ?? language,  // Use locale if available, otherwise fallback to language
    };
  }
}

// toJson and fromJson functions
Autosuggest _$AutosuggestFromJson(Map<String, dynamic> json) {
  return Autosuggest(
    suggestions: (json['suggestions'] as List<dynamic>)
        .map((e) => Suggestion.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AutosuggestToJson(Autosuggest instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions.map((e) => e.toJson()).toList(),
    };

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) {
  return Suggestion(
    country: json['country'] as String,
    nearestPlace: json['nearestPlace'] as String,
    words: json['words'] as String,
    distanceToFocusKm: json['distanceToFocusKm'] as int?,
    rank: json['rank'] as int,
    language: json['language'] as String,
    locale: json['locale'] as String?,  // Load locale if present
  );
}

Map<String, dynamic> _$SuggestionToJson(Suggestion instance) =>
    <String, dynamic>{
      'country': instance.country,
      'nearestPlace': instance.nearestPlace,
      'words': instance.words,
      'distanceToFocusKm': instance.distanceToFocusKm,
      'rank': instance.rank,
      'language': instance.language,
      'locale': instance.locale,  // Output locale if available
    };

AutosuggestWithCoordinates _$AutosuggestWithCoordinatesFromJson(
    Map<String, dynamic> json) {
  return AutosuggestWithCoordinates(
    suggestions: (json['suggestions'] as List<dynamic>)
        .map((e) =>
            SuggestionWithCoordinates.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AutosuggestWithCoordinatesToJson(
    AutosuggestWithCoordinates instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions.map((e) => e.toJson()).toList(),
    };

SuggestionWithCoordinates _$SuggestionWithCoordinatesFromJson(
    Map<String, dynamic> json) {
  return SuggestionWithCoordinates(
    country: json['country'] as String,
    nearestPlace: json['nearestPlace'] as String,
    words: json['words'] as String,
    coordinates: CoordinatesResponse.fromJson(
        json['coordinates'] as Map<String, dynamic>),
    distanceToFocusKm: json['distanceToFocusKm'] as int?,
    rank: json['rank'] as int,
    language: json['language'] as String,
    locale: json['locale'] as String?,  // Load locale if present
  );
}

Map<String, dynamic> _$SuggestionWithCoordinatesToJson(
    SuggestionWithCoordinates instance) =>
    <String, dynamic>{
      'country': instance.country,
      'nearestPlace': instance.nearestPlace,
      'words': instance.words,
      'coordinates': instance.coordinates.toJson(),
      'distanceToFocusKm': instance.distanceToFocusKm,
      'rank': instance.rank,
      'language': instance.language,
      'locale': instance.locale,  // Output locale if available
    };
