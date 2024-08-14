import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:what3words/src/response/location.dart';
import 'header_interceptor.dart';
import 'json_to_type_converter.dart';
import '../response/autosuggest.dart';
import '../response/grid_section.dart';
import '../response/language.dart';

part 'what3words_service.chopper.dart';

@ChopperApi()
abstract class What3WordsV3Service extends ChopperService {
  @Get(path: 'available-languages')
  Future<Response<Language>> availableLanguages();

  @Get(path: 'convert-to-coordinates')
  Future<Response<Location>> convertToCoordinates(@Query('words') String words);

  @Get(path: 'convert-to-3wa')
  Future<Response<Location>> convertTo3wa(
      @Query('coordinates') String coordinates,
      @Query('language') String? language);

  @Get(path: 'grid-section')
  Future<Response<GridSection>> gridSection(
      @Query('bounding-box') String boundingBox);

  @Get(path: 'autosuggest')
  Future<Response<Autosuggest>> autosuggest(
      @Query('input') String input,
      @Query('n-results') String? nResults,
      @Query('focus') String? focus,
      @Query('n-focus-results') String? nFocusResults,
      @Query('clip-to-country') String? clipToCountry,
      @Query('clip-to-bounding-box') String? clipToBoundingBox,
      @Query('clip-to-circle') String? clipToCircle,
      @Query('clip-to-polygon') String? clipToPolygon,
      @Query('input-type') String? inputType,
      @Query('language') String? lang,
      @Query('prefer-land') String? preferLand);

  @Get(path: 'autosuggest-with-coordinates')
  Future<Response<AutosuggestWithCoordinates>> autosuggestWithCoordinates(
      @Query('input') String input,
      @Query('n-results') String nResults,
      @Query('focus') String focus,
      @Query('n-focus-results') String nFocusResults,
      @Query('clip-to-country') String clipToCountry,
      @Query('clip-to-bounding-box') String clipToBoundingBox,
      @Query('clip-to-circle') String clipToCircle,
      @Query('clip-to-polygon') String clipToPolygon,
      @Query('input-type') String inputType,
      @Query('language') String lang,
      @Query('prefer-land') String preferLand);

  @Get(path: 'autosuggest-selection')
  Future<Response<String>> autosuggestSelection(
      @Query('raw-input') String rawInput,
      @Query('source-api') String sourceApi,
      @Query('selection') String selection,
      @Query('rank') int rank,
      @Query('n-results') String nResults,
      @Query('focus') String focus,
      @Query('n-focus-results') String nFocusResults,
      @Query('clip-to-country') String clipToCountry,
      @Query('clip-to-bounding-box') String clipToBoundingBox,
      @Query('clip-to-circle') String clipToCircle,
      @Query('clip-to-polygon') String clipToPolygon,
      @Query('input-type') String inputType,
      @Query('language') String lang,
      @Query('prefer-land') String preferLand);


  static What3WordsV3Service create(
      String? apiKey, String endpoint, Map<String, String>? headers) {
    if (apiKey == null) {
      throw ArgumentError('API key must not be null');
    }
    final client = ChopperClient(
        baseUrl: Uri(
            scheme: "https",
            host: endpoint.split("/")[0],
            path: endpoint.split("/")[1]),
        interceptors: [
          HeaderInterceptor(apiKey, headers), 
          HttpLoggingInterceptor()
        ],
        errorConverter: JsonConverter(),
        services: [
          _$What3WordsV3Service(),
        ],
        converter: JsonToTypeConverter({
          Location: (jsonData) => Location.fromJson(jsonData),
          Language: (jsonData) => Language.fromJson(jsonData),
          GridSection: (jsonData) => GridSection.fromJson(jsonData),
          Autosuggest: (jsonData) => Autosuggest.fromJson(jsonData),
          AutosuggestWithCoordinates: (jsonData) => AutosuggestWithCoordinates.fromJson(jsonData)
        }));
    return _$What3WordsV3Service(client);
  }
}
