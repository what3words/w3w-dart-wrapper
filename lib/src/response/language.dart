import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
part 'language.g.dart';

/// Encapsulates the list of supported what3words languages
@JsonSerializable(explicitToJson: true)
class Language extends Response<Language> {
  List<Languages> languages;

  Language({this.languages});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

/// A specific language supported by what3words
@JsonSerializable(explicitToJson: true)
class Languages {
  String nativeName;
  String code;
  String name;

  Languages({this.nativeName, this.code, this.name});

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
