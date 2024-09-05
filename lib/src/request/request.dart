import '../response/api_error.dart';
import '../response/what3words_error.dart';
import '../response/api_response.dart';
import '../service/what3words_v3.dart';
import '../response/response.dart';

class Request<T> {
  What3WordsV3 api;
  Request(this.api);

  Future<Response<T>> call(Function f, List params) async {
    APIResponse<T> apiResponse;

    try {
      var response = await Function.apply(f, params);
      apiResponse = APIResponse(response);

      if (!apiResponse.isSuccessful()) {
        Map errorResponse = response.error;

        APIError apiError;
        try {
          apiError = APIError(errorResponse['error']['code'],
              errorResponse['error']['message']);
        } catch (e) {
          apiError = APIError('UnknownError', response.error.toString());
        }

        apiResponse.setAPIError(apiError);
      }
    } catch (e) {
      apiResponse = APIResponse(null);
      if (e.runtimeType.toString() == 'SocketException' ||
          e.runtimeType.toString() == 'ClientException' ||
          e.runtimeType.toString() == 'XMLHttpRequest') {
        apiResponse.setAPIError(APIError('NetworkError', e.toString()));
      } else {
        apiResponse.setAPIError(APIError('UnknownError', e.toString()));
      }
    }
    var apiError = apiResponse.getAPIError();
    if (apiError != null) {
      // look for the error within the available error enums
      var what3wordsError = What3WordsError.get(apiError.code);

      what3wordsError.message = apiError.message;

      apiResponse.setError(what3wordsError);
    }

    var entity = Response<T>(apiResponse);
    return entity;
  }
}

class EmptyRequest {
  What3WordsV3 api;
  EmptyRequest(this.api);

  Future<Response<String>> call(Function f, List params) async {
    APIResponse<String> apiResponse;

    try {
      var response = await Function.apply(f, params);
      apiResponse = APIResponse(response);

      if (!apiResponse.isSuccessful()) {
        Map errorResponse = response.error;

        APIError apiError;
        try {
          apiError = APIError(errorResponse['error']['code'],
              errorResponse['error']['message']);
        } catch (e) {
          apiError = APIError('UnknownError', response.error.toString());
        }

        apiResponse.setAPIError(apiError);
      }
    } catch (e) {
      apiResponse = APIResponse(null);
      if (e.runtimeType.toString() == 'SocketException' ||
          e.runtimeType.toString() == 'ClientException' ||
          e.runtimeType.toString() == 'XMLHttpRequest') {
        apiResponse.setAPIError(APIError('NetworkError', e.toString()));
      } else {
        apiResponse.setAPIError(APIError('UnknownError', e.toString()));
      }
    }
    var apiError = apiResponse.getAPIError();
    if (apiError != null) {
      // look for the error within the available error enums
      var what3wordsError = What3WordsError.get(apiError.code);

      what3wordsError.message = apiError.message;

      apiResponse.setError(what3wordsError);
    }

    var entity = Response<String>(apiResponse);
    return entity;
  }
}
