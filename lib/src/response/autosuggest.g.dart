// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autosuggest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Autosuggest _$AutosuggestFromJson(Map<String, dynamic> json) {
  return Autosuggest(
    suggestions: (json['suggestions'] as List)
        ?.map((e) =>
            e == null ? null : Suggestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AutosuggestToJson(Autosuggest instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions?.map((e) => e?.toJson())?.toList(),
    };

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) {
  return Suggestion(
    country: json['country'] as String,
    nearestPlace: json['nearestPlace'] as String,
    words: json['words'] as String,
    distanceToFocusKm: json['distanceToFocusKm'] as int,
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
