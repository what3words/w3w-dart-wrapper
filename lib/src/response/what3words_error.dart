/// Contains collections of possible what3words error codes
class What3WordsError {
  static What3WordsError BAD_COORDINATES = What3WordsError('BadCoordinates');
  static What3WordsError BAD_LANGUAGE = What3WordsError('BadLanguage');

  static What3WordsError BAD_WORDS = What3WordsError('BadWords');

  static What3WordsError BAD_INPUT = What3WordsError('BadInput');
  static What3WordsError BAD_N_RESULTS = What3WordsError('BadNResults');
  static What3WordsError BAD_N_FOCUS_RESULTS =
      What3WordsError('BadNFocusResults');
  static What3WordsError BAD_FOCUS = What3WordsError('BadFocus');
  static What3WordsError BAD_CLIP_TO_CIRCLE =
      What3WordsError('BadClipToCircle');
  static What3WordsError BAD_CLIP_TO_BOUNDING_BOX =
      What3WordsError('BadClipToBoundingBox');
  static What3WordsError BAD_CLIP_TO_COUNTRY =
      What3WordsError('BadClipToCountry');
  static What3WordsError BAD_CLIP_TO_POLYGON =
      What3WordsError('BadClipToPolygon');
  static What3WordsError BAD_INPUT_TYPE = What3WordsError('BadInputType');

  static What3WordsError BAD_BOUNDING_BOX = What3WordsError('BadBoundingBox');
  static What3WordsError BAD_BOUNDING_BOX_TOO_BIG =
      What3WordsError('BadBoundingBoxTooBig');

  static What3WordsError INTERNAL_SERVER_ERROR =
      What3WordsError('InternalServerError');
  static What3WordsError INVALID_KEY = What3WordsError('InvalidKey');
  static What3WordsError QUOTAEXCEEDED_ERROR = What3WordsError('QuotaExceeded');
  static What3WordsError UNKNOWN_ERROR = What3WordsError('UnknownError');
  static What3WordsError NETWORK_ERROR = What3WordsError('NetworkError');

  String code;
  String? message;
  What3WordsError(this.code);

  static What3WordsError get(String? code) {
    switch (code) {
      case 'BadCoordinates':
        return BAD_COORDINATES;
      case 'BadLanguage':
        return BAD_LANGUAGE;
      case 'BadWords':
        return BAD_WORDS;
      case 'BadInput':
        return BAD_INPUT;
      case 'BadNResults':
        return BAD_N_RESULTS;
      case 'BadNFocusResults':
        return BAD_N_FOCUS_RESULTS;
      case 'BadFocus':
        return BAD_FOCUS;
      case 'BadClipToCircle':
        return BAD_CLIP_TO_CIRCLE;
      case 'BadClipToBoundingBox':
        return BAD_CLIP_TO_BOUNDING_BOX;
      case 'BadClipToCountry':
        return BAD_CLIP_TO_COUNTRY;
      case 'BadClipToPolygon':
        return BAD_CLIP_TO_POLYGON;
      case 'BadInputType':
        return BAD_INPUT_TYPE;
      case 'BadBoundingBox':
        return BAD_BOUNDING_BOX;
      case 'BadBoundingBoxTooBig':
        return BAD_BOUNDING_BOX_TOO_BIG;
      case 'InternalServerError':
        return INTERNAL_SERVER_ERROR;
      case 'InvalidKey':
        return INVALID_KEY;
      case 'QuotaExceeded':
        return QUOTAEXCEEDED_ERROR;
      case 'UnknownError':
        return UNKNOWN_ERROR;
      case 'NetworkError':
        return NETWORK_ERROR;
      default:
        return UNKNOWN_ERROR;
    }
  }
}
