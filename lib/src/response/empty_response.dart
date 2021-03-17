import 'package:json_annotation/json_annotation.dart';

import '../../what3words.dart';

/// Wrapper for a successful what3words response
class EmptyResponse {
  @JsonKey(ignore: true)
  EmptyAPIResponse response;

  void setResponse(EmptyAPIResponse response) {
    this.response = response;
  }

  What3WordsError getError() {
    return response.error;
  }

  bool isSuccessful() {
    return response.isSuccessful();
  }
}