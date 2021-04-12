// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return Language(
    languages: (json['languages'] as List<dynamic>)
        .map((e) => Languages.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'languages': instance.languages.map((e) => e.toJson()).toList(),
    };

Languages _$LanguagesFromJson(Map<String, dynamic> json) {
  return Languages(
    nativeName: json['nativeName'] as String,
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'nativeName': instance.nativeName,
      'code': instance.code,
      'name': instance.name,
    };
