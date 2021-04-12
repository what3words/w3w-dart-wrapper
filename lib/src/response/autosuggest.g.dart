// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autosuggest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
    };
