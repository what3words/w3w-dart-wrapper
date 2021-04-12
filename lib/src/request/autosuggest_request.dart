import 'package:what3words/src/response/api_response.dart';
import 'package:what3words/src/response/response.dart';

import 'autosuggest_options.dart';
import 'abstract_builder.dart';
import '../response/autosuggest.dart';
import '../service/what3words_v3.dart';
import 'request.dart';

class AutosuggestRequest extends Request<Autosuggest> {
  final String input;
  final String? nResults;
  final String? focus;
  final String? nFocusResults;
  final String? clipToCountry;
  final String? clipToBoundingBox;
  final String? clipToCircle;
  final String? clipToPolygon;
  final String? inputType;
  final String? language;
  final String? preferLand;

  AutosuggestRequest._builder(AutosuggestRequestBuilder builder)
      : input = builder._input,
        nResults = builder._options?.nResults,
        focus = builder._options?.focus,
        nFocusResults = builder._options?.nFocusResults,
        clipToCountry = builder._options?.clipToCountry,
        clipToBoundingBox = builder._options?.clipToBoundingBox,
        clipToCircle = builder._options?.clipToCircle,
        clipToPolygon = builder._options?.clipToPolygon,
        inputType = builder._options?.inputType,
        language = builder._options?.language,
        preferLand = builder._options?.preferLand,
        super(builder.api);

  Future<Response<Autosuggest>> execute() async {
    return await super.call(api.what3words().autosuggest, [
      input,
      nResults,
      focus,
      nFocusResults,
      clipToCountry,
      clipToBoundingBox,
      clipToCircle,
      clipToPolygon,
      inputType,
      language,
      preferLand
    ]);
  }
}

/// Builder for `autosuggest` API requests
class AutosuggestRequestBuilder extends AbstractBuilder<Future<Response<Autosuggest>>> {
  final String _input;
  final AutosuggestOptions? _options;

  AutosuggestRequestBuilder(What3WordsV3 api, this._input, this._options) : super(api);

  ///Execute the API call as represented by the values set within this [ConvertTo3WARequestBuilder]
  ///
  ///return an [Future<Autosuggest>] representing the response from the what3words API
  @override
  Future<Response<Autosuggest>> execute() {
    return AutosuggestRequest._builder(this).execute();
  }
}
