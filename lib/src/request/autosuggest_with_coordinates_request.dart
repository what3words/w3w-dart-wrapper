import 'package:what3words/src/request/request.dart';
import 'package:what3words/src/response/response.dart';

import '../../what3words.dart';
import 'autosuggest_options.dart';
import 'abstract_builder.dart';

class AutosuggestWithCoordinatesRequest extends Request<AutosuggestWithCoordinates> {
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

  AutosuggestWithCoordinatesRequest._builder(AutosuggestWithCoordinatesRequestBuilder builder)
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

  Future<Response<AutosuggestWithCoordinates>> execute() async {
    return await super.call(api.what3words().autosuggestWithCoordinates, [
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

/// Builder for `autosuggest-with-coordinates` API requests
class AutosuggestWithCoordinatesRequestBuilder extends AbstractBuilder<Future<Response<AutosuggestWithCoordinates>>> {
  final String _input;
  final AutosuggestOptions? _options;

  AutosuggestWithCoordinatesRequestBuilder(What3WordsV3 api, this._input, this._options) : super(api);

  ///Execute the API call as represented by the values set within this [ConvertTo3WARequestBuilder]
  ///
  ///return an [Future<Autosuggest>] representing the response from the what3words API
  @override
  Future<Response<AutosuggestWithCoordinates>> execute() {
    return AutosuggestWithCoordinatesRequest._builder(this).execute();
  }
}
