import 'autosuggest_input_type.dart';
import 'bounding_box.dart';
import 'coordinate.dart';

class AutosuggestOptions {
  String _nResults;
  String _focus;
  String _nFocusResults;
  String _clipToCountry;
  String _clipToBoundingBox;
  String _clipToCircle;
  String _clipToPolygon;
  String _inputType;
  String _language;
  String _preferLand;

  String get nResults => _nResults;
  String get focus => _focus;
  String get nFocusResults => _nFocusResults;
  String get clipToCountry => _clipToCountry;
  String get clipToBoundingBox => _clipToBoundingBox;
  String get clipToCircle => _clipToCircle;
  String get clipToPolygon => _clipToPolygon;
  String get inputType => _inputType;
  String get language => _language;
  String get preferLand => _preferLand;

  ///Set the number of AutoSuggest results to return. A maximum of 100 results can be specified, if a number greater than this is requested,
  ///this will be truncated to the maximum. The default is 3
  ///
  ///[n] the number of AutoSuggest results to return
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setNResults(int n) {
    _nResults = '$n';
    return this;
  }

  ///This is a location, specified as a latitude (often where the user making the query is). If specified, the results will be weighted to
  ///give preference to those near the <code>focus</code>. For convenience, longitude is allowed to wrap around the 180 line, so 361 is equivalent to 1.
  ///
  ///[coordinates] the focus to use
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setFocus(Coordinates coordinates) {
    _focus = '${coordinates.lat},${coordinates.lng}';
    return this;
  }

  ///Specifies the number of results (must be &lt;= nResults) within the results set which will have a focus. Defaults to `nResults`.
  ///This allows you to run `autosuggest` with a mix of focussed and unfocussed results, to give you a "blend" of the two. This is exactly what the old `V2`
  ///`standardblend` did, and `standardblend` behaviour can easily be replicated by passing `nFocusResults=1`, which will return just one
  ///focussed result and the rest unfocussed.
  ///
  ///[n] number of results within the results set which will have a focus
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setNFocusResults(int n) {
    _nFocusResults = '$n';
    return this;
  }

  ///Restrict autosuggest results to a circle, specified by <code>Coordinates</code> representing the centre of the circle, plus the
  ///[radius] in kilometres. For convenience, longitude is allowed to wrap around 180 degrees. For example 181 is equivalent to -179.
  ///
  ///[centre] the centre of the circle
  ///[radius] the radius of the circle in kilometres
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setClipToCircle(Coordinates centre, double radius) {
    _clipToCircle = '${centre.lat},${centre.lng},${radius}';
    return this;
  }

  ///Restrict autosuggest results to a polygon, specified by a collection of [Coordinates]. The polygon should be closed,
  ///i.e. the first element should be repeated as the last element; also the list should contain at least 4 entries. The API is currently limited to
  ///accepting up to 25 pairs.
  ///
  ///[polygon] the polygon to clip results too
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setClipToPolygon(List<Coordinates> polygon) {
    var coordinatesList = <String>[];
    for (final coordinates in polygon) {
      coordinatesList.add('${coordinates.lat}');
      coordinatesList.add('${coordinates.lng}');
    }

    _clipToPolygon = coordinatesList.join(',');
    return this;
  }

  ///Restrict autosuggest results to a [BoundingBox].
  ///
  ///[boundingBox] [BoundingBox] to clip results too
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setClipToBoundingBox(BoundingBox boundingBox) {
    _clipToBoundingBox =
    '${boundingBox.sw.lat},${boundingBox.sw.lng},${boundingBox.ne.lat},${boundingBox.ne.lng}';
    return this;
  }

  ///Restricts autosuggest to only return results inside the countries specified by comma-separated list of uppercase ISO 3166-1 alpha-2 country codes
  ///(for example, to restrict to Belgium and the UK, use [clipToCountry(['GB', 'BE'])]. [clipToCountry] will also accept lowercase
  ///country codes. Entries must be two a-z letters. WARNING: If the two-letter code does not correspond to a country, there is no error: API simply
  ///returns no results.
  ///
  ///[countryCodes] countries to clip results too
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setClipToCountry(List<String> countryCodes) {
    _clipToCountry = countryCodes.join(',');
    return this;
  }

  ///For normal text input, specifies a fallback language, which will help guide AutoSuggest if the input is particularly messy. If specified,
  ///this parameter must be a supported 3 word address language as an ISO 639-1 2 letter code. For voice input (see voice section),
  ///language must always be specified.
  ///
  ///[language] the fallback language
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setLanguage(String language) {
    _language = language;
    return this;
  }

  ///For power users, used to specify voice input mode. Can be [AutosuggestInputType.TEXT] (default), [AutosuggestInputType.VOCON_HYBRID],
  ///[AutosuggestInputType.NMDP_ASR]. See voice recognition section within the developer docs for more details https://docs.what3words.com/api/v3/#voice.
  ///
  ///[type] the [AutosuggestInputType]
  ///
  ///Returns an [AutosuggestOptions] instance suitable to allow more query customisation
  AutosuggestOptions setInputType(AutosuggestInputType type) {
    _inputType = type.value;
    return this;
  }

  AutosuggestOptions setPreferLand(bool preferLand) {
    _preferLand = '$preferLand';
    return this;
  }

}