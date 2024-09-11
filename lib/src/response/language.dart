/// Encapsulates the list of supported what3words languages
class Language {
  List<Languages> languages;

  Language({required this.languages});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

/// A specific language supported by what3words
class Languages {
  String nativeName;
  String code;
  String name;
  List<Locale>? locales; // Add the list of locales

  Languages({
    required this.nativeName,
    required this.code,
    required this.name,
    this.locales, // Include locales in the constructor
  });

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}

/// Represents a specific locale within a language
class Locale {
  String nativeName;
  String code;
  String name;

  Locale({
    required this.nativeName,
    required this.code,
    required this.name,
  });

  factory Locale.fromJson(Map<String, dynamic> json) => _$LocaleFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleToJson(this);
}

// toJson, fromJson for Language
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

// toJson, fromJson for Languages
Languages _$LanguagesFromJson(Map<String, dynamic> json) {
  return Languages(
    nativeName: json['nativeName'] as String,
    code: json['code'] as String,
    name: json['name'] as String,
    locales: (json['locales'] as List<dynamic>?)
        ?.map((e) => Locale.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'nativeName': instance.nativeName,
      'code': instance.code,
      'name': instance.name,
      'locales': instance.locales?.map((e) => e.toJson()).toList(),
    };

// toJson, fromJson for Locale
Locale _$LocaleFromJson(Map<String, dynamic> json) {
  return Locale(
    nativeName: json['nativeName'] as String,
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LocaleToJson(Locale instance) => <String, dynamic>{
      'nativeName': instance.nativeName,
      'code': instance.code,
      'name': instance.name,
    };
