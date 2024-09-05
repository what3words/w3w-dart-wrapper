import 'package:what3words/src/request/autosuggest_options.dart';
import 'package:what3words/src/request/autosuggest_selection_request.dart';
import 'package:what3words/src/request/autosuggest_with_coordinates_request.dart';

import '../request/autosuggest_request.dart';
import '../request/available_languages_request.dart';
import '../request/convert_to_3wa_request.dart';
import '../request/convert_to_coordinates_request.dart';
import '../request/coordinate.dart';
import '../request/grid_section_request.dart';
import 'what3words_service.dart';
import 'package:what3words/src/response/isvalid3wa_response.dart';

///Instances of the What3WordsV3 class provide access to Version 3 of the what3words API.
class What3WordsV3 {
  final _defaultEndpoint = "api.what3words.com/v3";
  late What3WordsV3Service _service;

  ///Get a new API manager instance.
  ///
  ///[apiKey] Your what3words API key obtained from https://what3words.com/select-plan
  What3WordsV3(String apiKey) {
    _setupHttpClient(apiKey, _defaultEndpoint, null);
  }

  /// Get a new API manager instance.
  ///
  ///[apiKey] Your what3words API key obtained from https://what3words.com/select-plan
  ///[endpoint] override the default public API endpoint
  What3WordsV3.withEndpoint(String apiKey, String endpoint) {
    _setupHttpClient(apiKey, endpoint, null);
  }

  ///Get a new API manager instance.
  ///[apiKey] Your what3words API key obtained from https://accounts.what3words.com
  ///[endpoint] override the default public API endpoint
  ///[headers] add any custom HTTP headers to send in each request
  What3WordsV3.withHeaders(
      String apiKey, String endpoint, Map<String, String> headers) {
    _setupHttpClient(apiKey, endpoint, headers);
  }

  void _setupHttpClient(
      String apiKey, String endpoint, Map<String, String>? headers) {
    _service = What3WordsV3Service.create(apiKey, endpoint, headers);
  }

  /// Check if a string is a possible what3words address using regex.
  ///
  /// [text] The string to check.
  /// Returns true if it's a match against the regex, false otherwise.
  bool isPossible3wa(String text) {
    var regex = RegExp(r"^\/{0,}(?:[^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}[.｡。･・︒។։။۔።।][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}[.｡。･・︒។։။۔።।][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}|[^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}([\u0020\u00A0][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]+){1,3}[.｡。･・︒។։။۔።।][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}([\u0020\u00A0][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]+){1,3}[.｡。･・︒។։။۔።।][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}([\u0020\u00A0][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]+){1,3})$");
    return regex.hasMatch(text);
  }
   
  /// Check if a string is a possible what3words address with different separators.
  ///
  /// [text] The string to check.
  /// Returns true if it's a match against the regex, false otherwise.
  bool didYouMean3wa(String text) {
    var regex = RegExp(r"[^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}[.｡。･・︒។։။۔።। ,\\\\^_/+'&:;|　-]{1,2}[^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}[.｡。･・︒។։။۔።। ,\\\\^_/+'&:;|　-]{1,2}[^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r';:£§º©®\s]{1,}');
    return regex.hasMatch(text);
  }

  /// Find all possible what3words addresses in a string.
  ///
  /// [text] The string to search.
  /// Returns a list of possible what3words addresses.
  List<String> findPossible3wa(String text) {
    var regex = RegExp(r"[^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}[.｡。･・︒។։။۔።।][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r";:£§º©®\s]{1,}[.｡。･・︒។։။۔።।][^0-9`~!@#$%^&*()+\-_=[{\]}\\|'<,.>?\/"'"'r';:£§º©®\s]{1,}');
    var matches = regex.allMatches(text);
    return matches.map((match) => match.group(0) ?? "").toList();  
  }

  ///Convert a 3 word address to a latitude and longitude. It also returns country, the bounds of the grid square,
  ///a nearest place (such as a local town) and a link to our map site.
  ///
  ///[words] A 3 word address as a string. It must be three words separated with dots or a Japanese middle dot character (・).
  ///Words separated by spaces will be rejected. Optionally, the 3 word address can be prefixed with ///
  ///
  ///returns a [ConvertToCoordinatesRequestBuilder] instance suitable for invoking a `convert-to-coordinates` API request
  ConvertToCoordinatesRequestBuilder convertToCoordinates(String words) {
    return ConvertToCoordinatesRequestBuilder(this, words);
  }

  ///Convert a latitude and longitude to a 3 word address, in the language of your choice. It also returns country,
  ///the bounds of the grid square, a nearest place (such as a local town) and a link to our map site.
  ///
  ///[coordinates] the latitude and longitude of the location to convert to 3 word address
  ///
  ///returns a [ConvertTo3WARequestBuilder] instance suitable for invoking a `convert-to-3wa` API request
  ConvertTo3WARequestBuilder convertTo3wa(Coordinates coordinates) {
    return ConvertTo3WARequestBuilder(this, coordinates);
  }

  ///Retrieves a list all available 3 word address languages, including the ISO 639-1 2 letter code, english name and native name.
  ///
  ///returns a [AvailableLanguagesRequestBuilder] instance suitable for invoking a `available-languages` API request
  AvailableLanguagesRequestBuilder availableLanguages() {
    return AvailableLanguagesRequestBuilder(this);
  }

  ///Returns a section of the 3m x 3m what3words grid for a bounding box. The bounding box is specified by lat,lng,lat,lng
  ///as south,west,north,east.
  ///
  ///[southwest], SouthWest point of the bounding box for which the grid should be returned. The requested box must not exceed 4km
  ///from corner to corner. Latitudes must be &gt;= -90 and &lt;= 90, but longitudes are allowed to wrap around 180. To specify a
  ///bounding-box that crosses the anti-meridian, use longitude greater than 180.
  ///[northeast], NorthEast point of the bounding box for which the grid should be returned. The requested box must not exceed 4km
  ///from corner to corner. Latitudes must be &gt;= -90 and &lt;= 90, but longitudes are allowed to wrap around 180. To specify a
  ///bounding-box that crosses the anti-meridian, use longitude greater than 180.
  ///
  ///returns a [GridSectionRequestBuilder] instance suitable for invoking a `grid-section` API request
  GridSectionRequestBuilder gridSection(Coordinates southwest, Coordinates northeast) {
    return GridSectionRequestBuilder(this, southwest, northeast);
  }

  ///AutoSuggest can take a slightly incorrect 3 word address, and suggest a list of valid 3 word addresses. It has powerful
  ///features which can, for example, optionally limit results to a country or area, and prefer results which are near the user.
  ///For full details, please see the complete API documentation at https://docs.what3words.com/api/v3/#autosuggest
  ///
  ///[input] The full or partial 3 word address to obtain suggestions for. At minimum this must be the first two complete
  ///words plus at least one character from the third word.
  ///[options] The autosuggest options and clippings, check available options here https://docs.what3words.com/api/v3/#autosuggest
  ///
  ///returns a [AutosuggestRequestBuilder] instance suitable for invoking a `autosuggest` API request
  AutosuggestRequestBuilder autosuggest(String input, {AutosuggestOptions? options}) {
    return AutosuggestRequestBuilder(this, input, options);
  }

  ///AutoSuggestWithCoordinates can take a slightly incorrect 3 word address, and suggest a list of valid 3 word addresses including coordinates. It has powerful
  ///features which can, for example, optionally limit results to a country or area, and prefer results which are near the user.
  ///For full details, please see the complete API documentation at https://docs.what3words.com/api/v3/#autosuggest
  ///
  ///[input] The full or partial 3 word address to obtain suggestions for. At minimum this must be the first two complete
  ///words plus at least one character from the third word.
  ///[options] The autosuggest options, check available options here https://docs.what3words.com/api/v3/#autosuggest
  ///
  ///returns a [AutosuggestWithCoordinatesRequestBuilder] instance suitable for invoking a `autosuggest` API request
  AutosuggestWithCoordinatesRequestBuilder autosuggestWithCoordinates(String input, {AutosuggestOptions? options}) {
    return AutosuggestWithCoordinatesRequestBuilder(this, input, options);
  }

  ///autosuggest-selection enables simple reporting for what3words address selections in accounts.what3words.com.
  ///It should be called once in conjunction with autosuggest or autosuggest-with-coordinates.
  ///when an end user picks a what3words address from the suggestions presented to them.
  ///[rawInput] The full or partial 3 word address used on the autosuggest or autosuggest-with-coordinates call.
  ///[sourceApi] The source of the selected autosuggest, can be 'text' or 'voice'.
  ///[words] The 3 word address of the selected suggestion.
  ///[rank] The rank of the selected suggestion.
  ///[options] The autosuggest options used on the autosuggest or autosuggest-with-coordinates call.
  ///returns a [AutosuggestWithCoordinatesRequestBuilder] instance suitable for invoking a `autosuggest` API request
  AutosuggestSelectionRequestBuilder autosuggestSelection(String rawInput, String sourceApi, String words, int rank, {AutosuggestOptions? options}) {
    return AutosuggestSelectionRequestBuilder(this, rawInput, sourceApi, words, rank, options);
  }

  /// This function checks whether a given what3words address is valid.
  ///
  /// The function first verifies if the input string is a possible 
  /// what3words address format by using the `isPossible3wa` method. 
  /// If the format is invalid, it returns an error indicating 
  /// `BAD_WORDS`. 
  ///
  /// If the input format is correct, the function then calls the 
  /// `autosuggest` API with a limit of one result. The function 
  /// evaluates the response from the API:
  /// - If the API request fails, it checks if the failure is due to 
  /// an invalid API key (`INVALID_KEY`) or some other error, and 
  /// returns the appropriate error response.
  /// - If the request is successful and the first suggestion matches 
  /// the input address, it returns a success response indicating 
  /// that the address is valid.
  ///
  /// If no valid match is found, the function returns a `BAD_WORDS` 
  /// error, indicating that the address is not recognized as a valid 
  /// what3words address.
  ///
  /// Returns:
  /// - `IsValid3waResponse`: A custom response object indicating 
  /// whether the address is valid and if any errors occurred.
  ///
  /// Example:
  /// ```dart
  /// var response = await api.isValid3wa("filled.count.soap");
  /// if (response.isSuccessful() && response.isValid == true) {
  ///   print("Valid address");
  /// } else {
  ///   print("Invalid address or error: ${response.error?.message}");
  /// }
  /// ```
  Future<IsValid3waResponse> isValid3wa(String words) async {
    if (!isPossible3wa(words)) {
      return IsValid3waResponse.success(false);
    }

    var autosuggestResult = await autosuggest(words, options: AutosuggestOptions().setNResults(1)).execute();

    if (!autosuggestResult.isSuccessful()) {
      return IsValid3waResponse.error(autosuggestResult.error()!);
    }

    for (var suggestion in autosuggestResult.data()?.suggestions ?? []) {
      if (suggestion.words.replaceAll("/", "").toLowerCase() ==
          words.replaceAll("/", "").toLowerCase()) {
        return IsValid3waResponse.success(true);
      }
    }

    return IsValid3waResponse.success(false);
  }

  What3WordsV3Service what3words() {
    return _service;
  }
}

