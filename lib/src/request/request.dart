import 'dart:io';

import '../response/api_error.dart';
import '../response/what3words_error.dart';
import '../response/api_response.dart';
import '../service/what3words_v3.dart';
import '../response/response.dart';

class Request<T extends Response<T>> {
  What3WordsV3 api;
  Request(this.api);

  Future<T> call(Function f, T emptyEntity, List params) async {
    APIResponse<T> apiResponse;

    try {
      var response = await Function.apply(f, params);
      apiResponse = APIResponse(response);

      if (!apiResponse.isSuccessful()) {
        Map errorResponse = response.error;

        var apiError;
        try {
          apiError = APIError(errorResponse['error']['code'],
              errorResponse['error']['message']);
        } catch (e) {
          apiError = APIError('UnknownError', response.error.toString());
        }

        apiResponse.setAPIError(apiError);
      }
    } on SocketException catch (e) {
      apiResponse = APIResponse(null);
      var apiError = APIError('NetworkError', e.toString());
      apiResponse.setAPIError(apiError);
    } catch (e) {
      apiResponse = APIResponse(null);
      var apiError = APIError('UnknownError', e.toString());
      apiResponse.setAPIError(apiError);
    }
    var apiError = apiResponse.getAPIError();
    if (apiError != null) {
      // look for the error within the available error enums
      var what3wordsError = What3WordsError.get(apiError.code);

      what3wordsError.message = apiError.message;

      apiResponse.setError(what3wordsError);
    }

    var entity = apiResponse.body();
    entity ??= emptyEntity;
    entity.setResponse(apiResponse);

    return entity;
  }
}
