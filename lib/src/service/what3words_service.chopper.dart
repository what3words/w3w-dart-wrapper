// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'what3words_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$What3WordsV3Service extends What3WordsV3Service {
  _$What3WordsV3Service([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = What3WordsV3Service;

  @override
  Future<Response<Language>> availableLanguages() {
    final Uri $url = Uri.parse('available-languages');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Language, Language>($request);
  }

  @override
  Future<Response<Location>> convertToCoordinates(String words) {
    final Uri $url = Uri.parse('convert-to-coordinates');
    final Map<String, dynamic> $params = <String, dynamic>{'words': words};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Location, Location>($request);
  }

  @override
  Future<Response<Location>> convertTo3wa(
    String coordinates,
    String? language,
    // String? locale,
  ) {
    final Uri $url = Uri.parse('convert-to-3wa');
    final Map<String, dynamic> $params = <String, dynamic>{
      'coordinates': coordinates,
      'language': language,
      // 'locale': locale,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Location, Location>($request);
  }

  @override
  Future<Response<GridSection>> gridSection(String boundingBox) {
    final Uri $url = Uri.parse('grid-section');
    final Map<String, dynamic> $params = <String, dynamic>{
      'bounding-box': boundingBox
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<GridSection, GridSection>($request);
  }

  @override
  Future<Response<Autosuggest>> autosuggest(
    String input,
    String? nResults,
    String? focus,
    String? nFocusResults,
    String? clipToCountry,
    String? clipToBoundingBox,
    String? clipToCircle,
    String? clipToPolygon,
    String? inputType,
    String? lang,
    String? preferLand,
    String? locale,
  ) {
    final Uri $url = Uri.parse('autosuggest');
    final Map<String, dynamic> $params = <String, dynamic>{
      'input': input,
      'n-results': nResults,
      'focus': focus,
      'n-focus-results': nFocusResults,
      'clip-to-country': clipToCountry,
      'clip-to-bounding-box': clipToBoundingBox,
      'clip-to-circle': clipToCircle,
      'clip-to-polygon': clipToPolygon,
      'input-type': inputType,
      'language': lang,
      'prefer-land': preferLand,
      'locale': locale,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Autosuggest, Autosuggest>($request);
  }

  @override
  Future<Response<AutosuggestWithCoordinates>> autosuggestWithCoordinates(
    String input,
    String? nResults,
    String? focus,
    String? nFocusResults,
    String? clipToCountry,
    String? clipToBoundingBox,
    String? clipToCircle,
    String? clipToPolygon,
    String? inputType,
    String? lang,
    String? preferLand,
    String? locale,
  ) {
    final Uri $url = Uri.parse('autosuggest-with-coordinates');
    final Map<String, dynamic> $params = <String, dynamic>{
      'input': input,
      'n-results': nResults,
      'focus': focus,
      'n-focus-results': nFocusResults,
      'clip-to-country': clipToCountry,
      'clip-to-bounding-box': clipToBoundingBox,
      'clip-to-circle': clipToCircle,
      'clip-to-polygon': clipToPolygon,
      'input-type': inputType,
      'language': lang,
      'prefer-land': preferLand,
      'locale': locale,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<AutosuggestWithCoordinates, AutosuggestWithCoordinates>($request);
  }

  @override
  Future<Response<String>> autosuggestSelection(
    String rawInput,
    String sourceApi,
    String selection,
    int rank,
    String? nResults,
    String? focus,
    String? nFocusResults,
    String? clipToCountry,
    String? clipToBoundingBox,
    String? clipToCircle,
    String? clipToPolygon,
    String? inputType,
    String? lang,
    String? preferLand,
    String? locale,
  ) {
    final Uri $url = Uri.parse('autosuggest-selection');
    final Map<String, dynamic> $params = <String, dynamic>{
      'raw-input': rawInput,
      'source-api': sourceApi,
      'selection': selection,
      'rank': rank,
      'n-results': nResults,
      'focus': focus,
      'n-focus-results': nFocusResults,
      'clip-to-country': clipToCountry,
      'clip-to-bounding-box': clipToBoundingBox,
      'clip-to-circle': clipToCircle,
      'clip-to-polygon': clipToPolygon,
      'input-type': inputType,
      'language': lang,
      'prefer-land': preferLand,
      'locale': locale,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<String, String>($request);
  }
}
