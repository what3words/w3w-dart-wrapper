import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:os_detect/os_detect.dart' as _platform;

class HeaderInterceptor implements RequestInterceptor {
  // This version must be updated in tandem with the pubspec version.
  static const String APP_VERSION = '3.0.3';

  static final String auth_header = 'X-API-KEY';
  static final String w3w_wrapper = 'X-W3W-Wrapper';

  final String _apiKey;
  final Map<String, String>? _headers;

  final String _userAgent;

  HeaderInterceptor(apiKey, headers)
      : _apiKey = apiKey,
        _headers = headers,
        _userAgent = getUserAgent();

  static String getUserAgent() {
    return 'what3words-Dart/$APP_VERSION (${_platform.operatingSystem}; ${_platform.operatingSystemVersion})';
  }

  @override
  FutureOr<Request> onRequest(Request request) async {
    var headers = <String, String>{
      auth_header: _apiKey,
      w3w_wrapper: _userAgent
    };

    _headers?.forEach((k, v) => headers[k] = v);

    var newRequest = request.copyWith(headers: headers);
    return newRequest;
  }
}
