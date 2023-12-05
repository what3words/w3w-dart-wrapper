import 'package:what3words/what3words.dart';

void main() async {
  // For all requests a what3words API key is needed
  // var api = What3WordsV3('what3words-api-key');
  var api = What3WordsV3('what3words-api-key');

  // Vanilla autosuggest, limiting the number of results to three */
  var autosuggest = await api
      .autosuggest('filled.count.soap',
          options: AutosuggestOptions().setNResults(3))
      .execute();

  if (autosuggest.isSuccessful()) {
    print('Autosuggest: ${autosuggest.data()?.toJson()}');
  } else {
    var error = autosuggest.error();

    if (error == What3WordsError.BAD_N_RESULTS) {
      // The coordinates provided were bad
      print('BadNResults: ${error!.message}');
    } else if (error == What3WordsError.INTERNAL_SERVER_ERROR) {
      // Server Error
      print('InternalServerError: ${error!.message}');
    } else if (error == What3WordsError.NETWORK_ERROR) {
      // Network Error
      print('NetworkError: ${error!.message}');
    } else {
      print('${error!.code} : ${error.message}');
    }
  }

  /** autosuggest demonstrating clipping to polygon, circle, bounding box, and country */
  var options = AutosuggestOptions().setClipToPolygon([
    Coordinates(52.321911, 1.516113),
    Coordinates(52.321911, -2.021484),
    Coordinates(50.345460, -2.021484),
    Coordinates(52.321911, 1.516113)
  ]);
  autosuggest =
      await api.autosuggest('filled.count.soap', options: options).execute();

  // autosuggest = await api
  //     .autosuggest('filled.count.soap')
  //     .clipToCircle(Coordinate(51.520833, -0.195543), 10)
  //     .execute();

  // autosuggest = await api
  //     .autosuggest('filled.count.soap')
  //     .clipToBoundingBox(BoundingBox(
  //         Coordinate(50.345460, -2.021484), Coordinate(52.321911, 1.516113)))
  //     .execute();

  // autosuggest = await api
  //     .autosuggest('filled.count.soap')
  //     .clipToCountry(['fr', 'de']).execute();

  if (autosuggest.isSuccessful()) {
    print('Autosuggest: ${autosuggest.data()?.toJson()}');
  } else {
    var error = autosuggest.error();

    if (error == What3WordsError.BAD_CLIP_TO_CIRCLE) {
      // The circle clip provided is not valid
      print('BadClipToCircle: ${error!.message}');
    } else if (error == What3WordsError.BAD_CLIP_TO_BOUNDING_BOX) {
      // The bounding box clip provided is not valid
      print('BadClipToBoundingBox: ${error!.message}');
    } else if (error == What3WordsError.BAD_CLIP_TO_COUNTRY) {
      // The country list provided is not valid
      print('BadClipToCountry: ${error!.message}');
    } else if (error == What3WordsError.BAD_CLIP_TO_POLYGON) {
      // The polygon clip provided is not valid
      print('BadClipToPolygon: ${error!.message}');
    } else if (error == What3WordsError.INTERNAL_SERVER_ERROR) {
      // Server Error
      print('InternalServerError: ${error!.message}');
    } else if (error == What3WordsError.NETWORK_ERROR) {
      // Network Error
      print('NetworkError: ${error!.message}');
    } else {
      print('${error!.code} : ${error.message}');
    }
  }

  /** autosuggest with an input type of VoCon Hybrid */
  options = AutosuggestOptions()
      .setInputType(AutosuggestInputType.VOCON_HYBRID)
      .setLanguage('en');
  autosuggest = await api
      .autosuggest(
          '{\"_isInGrammar\":\"yes\",\"_isSpeech\":\"yes\",\"_hypotheses\":[{\"_score\":342516,\"_startRule\":\"whatthreewordsgrammar#_main_\",\"_conf\":6546,\"_endTimeMs\":6360,\"_beginTimeMs\":1570,\"_lmScore\":300,\"_items\":[{\"_type\":\"terminal\",\"_score\":34225,\"_orthography\":\"tend\",\"_conf\":6964,\"_endTimeMs\":2250,\"_beginTimeMs\":1580},{\"_type\":\"terminal\",\"_score\":47670,\"_orthography\":\"artichokes\",\"_conf\":7176,\"_endTimeMs\":3180,\"_beginTimeMs\":2260},{\"_type\":\"terminal\",\"_score\":43800,\"_orthography\":\"poached\",\"_conf\":6181,\"_endTimeMs\":4060,\"_beginTimeMs\":3220}]},{\"_score\":342631,\"_startRule\":\"whatthreewordsgrammar#_main_\",\"_conf\":6498,\"_endTimeMs\":6360,\"_beginTimeMs\":1570,\"_lmScore\":300,\"_items\":[{\"_type\":\"terminal\",\"_score\":34340,\"_orthography\":\"tent\",\"_conf\":6772,\"_endTimeMs\":2250,\"_beginTimeMs\":1580},{\"_type\":\"terminal\",\"_score\":47670,\"_orthography\":\"artichokes\",\"_conf\":7176,\"_endTimeMs\":3180,\"_beginTimeMs\":2260},{\"_type\":\"terminal\",\"_score\":43800,\"_orthography\":\"poached\",\"_conf\":6181,\"_endTimeMs\":4060,\"_beginTimeMs\":3220}]},{\"_score\":342668,\"_startRule\":\"whatthreewordsgrammar#_main_\",\"_conf\":6474,\"_endTimeMs\":6360,\"_beginTimeMs\":1570,\"_lmScore\":300,\"_items\":[{\"_type\":\"terminal\",\"_score\":34225,\"_orthography\":\"tend\",\"_conf\":6964,\"_endTimeMs\":2250,\"_beginTimeMs\":1580},{\"_type\":\"terminal\",\"_score\":47670,\"_orthography\":\"artichokes\",\"_conf\":7176,\"_endTimeMs\":3180,\"_beginTimeMs\":2260},{\"_type\":\"terminal\",\"_score\":41696,\"_orthography\":\"perch\",\"_conf\":5950,\"_endTimeMs\":4020,\"_beginTimeMs\":3220}]},{\"_score\":342670,\"_startRule\":\"whatthreewordsgrammar#_main_\",\"_conf\":6474,\"_endTimeMs\":6360,\"_beginTimeMs\":1570,\"_lmScore\":300,\"_items\":[{\"_type\":\"terminal\",\"_score\":34379,\"_orthography\":\"tinge\",\"_conf\":6705,\"_endTimeMs\":2250,\"_beginTimeMs\":1580},{\"_type\":\"terminal\",\"_score\":47670,\"_orthography\":\"artichokes\",\"_conf\":7176,\"_endTimeMs\":3180,\"_beginTimeMs\":2260},{\"_type\":\"terminal\",\"_score\":43800,\"_orthography\":\"poached\",\"_conf\":6181,\"_endTimeMs\":4060,\"_beginTimeMs\":3220}]},{\"_score\":342783,\"_startRule\":\"whatthreewordsgrammar#_main_\",\"_conf\":6426,\"_endTimeMs\":6360,\"_beginTimeMs\":1570,\"_lmScore\":300,\"_items\":[{\"_type\":\"terminal\",\"_score\":34340,\"_orthography\":\"tent\",\"_conf\":6772,\"_endTimeMs\":2250,\"_beginTimeMs\":1580},{\"_type\":\"terminal\",\"_score\":47670,\"_orthography\":\"artichokes\",\"_conf\":7176,\"_endTimeMs\":3180,\"_beginTimeMs\":2260},{\"_type\":\"terminal\",\"_score\":41696,\"_orthography\":\"perch\",\"_conf\":5950,\"_endTimeMs\":4020,\"_beginTimeMs\":3220}]},{\"_score\":342822,\"_startRule\":\"whatthreewordsgrammar#_main_\",\"_conf\":6402,\"_endTimeMs\":6360,\"_beginTimeMs\":1570,\"_lmScore\":300,\"_items\":[{\"_type\":\"terminal\",\"_score\":34379,\"_orthography\":\"tinge\",\"_conf\":6705,\"_endTimeMs\":2250,\"_beginTimeMs\":1580},{\"_type\":\"terminal\",\"_score\":47670,\"_orthography\":\"artichokes\",\"_conf\":7176,\"_endTimeMs\":3180,\"_beginTimeMs\":2260},{\"_type\":\"terminal\",\"_score\":41696,\"_orthography\":\"perch\",\"_conf\":5950,\"_endTimeMs\":4020,\"_beginTimeMs\":3220}]}],\"_resultType\":\"NBest\"}',
          options: options)
      .execute();
  if (autosuggest.isSuccessful()) {
    print('Autosuggest: ${autosuggest.data()?.toJson()}');
  } else {
    var error = autosuggest.error();

    if (error == What3WordsError.BAD_INPUT) {
      // The input is not valid, given the input type provided
      print('BadInput: ${error!.message}');
    } else if (error == What3WordsError.BAD_INPUT_TYPE) {
      // The input type is not valid
      print('BadInputType: ${error!.message}');
    } else if (error == What3WordsError.BAD_LANGUAGE) {
      // The provided language is not valid
      print('BadLanguage: ${error!.message}');
    } else if (error == What3WordsError.INTERNAL_SERVER_ERROR) {
      // Server Error
      print('InternalServerError: ${error!.message}');
    } else if (error == What3WordsError.NETWORK_ERROR) {
      // Network Error
      print('NetworkError: ${error!.message}');
    } else {
      print('${error!.code} : ${error.message}');
    }
  }
}
