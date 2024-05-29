// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'what3words_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$What3WordsV3Service extends What3WordsV3Service {
  _$What3WordsV3Service([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = What3WordsV3Service;

  @override
  Future<Response<Language>> availableLanguages() {
    final $url = Uri(path: 'available-languages');
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Language, Language>($request);
  }

  @override
  Future<Response<Location>> convertToCoordinates(String words) {
    final $url = Uri(path: 'convert-to-coordinates');
    final $params = <String, dynamic>{'words': words};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Location, Location>($request);
  }

  @override
  Future<Response<Location>> convertTo3wa(
      String coordinates, String? language) {
    final $url = Uri(path: 'convert-to-3wa');
    final $params = <String, dynamic>{
      'coordinates': coordinates,
      'language': language
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Location, Location>($request);
  }

  @override
  Future<Response<GridSection>> gridSection(String boundingBox) {
    final $url = Uri(path: 'grid-section');
    final $params = <String, dynamic>{'bounding-box': boundingBox};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
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
      String? preferLand) {
    final $url = Uri(path: 'autosuggest');
    final $params = <String, dynamic>{
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
      'prefer-land': preferLand
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
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
      String? preferLand) {
    final $url = Uri(path: 'autosuggest-with-coordinates');
    final $params = <String, dynamic>{
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
      'prefer-land': preferLand
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
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
      String? preferLand) {
    final $url = Uri(path: 'autosuggest-selection');
    final $params = <String, dynamic>{
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
      'prefer-land': preferLand
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<String, String>($request);
  }
}
