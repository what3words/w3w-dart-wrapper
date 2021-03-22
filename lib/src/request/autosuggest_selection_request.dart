import 'package:what3words/src/request/request.dart';
import 'package:what3words/src/response/response.dart';

import '../../what3words.dart';
import 'abstract_builder.dart';
import 'autosuggest_options.dart';

class AutosuggestSelectionRequest extends EmptyRequest {
  final String rawInput;
  final String sourceApi;
  final String selection;
  final int rank;
  final String nResults;
  final String focus;
  final String nFocusResults;
  final String clipToCountry;
  final String clipToBoundingBox;
  final String clipToCircle;
  final String clipToPolygon;
  final String inputType;
  final String language;
  final String preferLand;

  AutosuggestSelectionRequest._builder(
      AutosuggestSelectionRequestBuilder builder)
      : rawInput = builder._rawInput,
        sourceApi = builder._sourceApi,
        selection = builder._words,
        rank = builder._rank,
        nResults = builder._options.nResults,
        focus = builder._options.focus,
        nFocusResults = builder._options.nFocusResults,
        clipToCountry = builder._options.clipToCountry,
        clipToBoundingBox = builder._options.clipToBoundingBox,
        clipToCircle = builder._options.clipToCircle,
        clipToPolygon = builder._options.clipToPolygon,
        inputType = builder._options.inputType,
        language = builder._options.language,
        preferLand = builder._options.preferLand,
        super(builder.api);

  Future<Response<String>> execute() async {
    return await super.call(api.what3words().autosuggestSelection, [
      rawInput,
      sourceApi,
      selection,
      rank,
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
class AutosuggestSelectionRequestBuilder
    extends AbstractBuilder<Future<Response<String>>> {
  final String _rawInput;
  final String _sourceApi;
  final String _words;
  final int _rank;
  final AutosuggestOptions _options;

  AutosuggestSelectionRequestBuilder(What3WordsV3 api, this._rawInput,
      this._sourceApi, this._words, this._rank, this._options)
      : super(api);

  ///Execute the API call as represented by the values set within this [ConvertTo3WARequestBuilder]
  ///
  ///return an [Future<Autosuggest>] representing the response from the what3words API
  @override
  Future<Response<String>> execute() {
    return AutosuggestSelectionRequest._builder(this).execute();
  }
}
