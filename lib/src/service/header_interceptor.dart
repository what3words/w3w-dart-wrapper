import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:os_detect/os_detect.dart' as platform;

class HeaderInterceptor implements Interceptor {
  static const String APP_VERSION = '3.2.0';
  static final String authHeader = 'X-API-KEY';
  static final String w3wWrapper = 'X-W3W-Wrapper';

  final String _apiKey;
  final Map<String, String>? _headers;
  final String _userAgent;

  HeaderInterceptor(this._apiKey, this._headers) : _userAgent = _getUserAgent();

  static String _getUserAgent() {
    return 'what3words-Dart/$APP_VERSION (${platform.operatingSystem}; ${platform.operatingSystemVersion})';
  }

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final request = chain.request;
    final headers = Map<String, String>.from(request.headers);

    headers[authHeader] = _apiKey;
    headers[w3wWrapper] = _userAgent;

    if (_headers != null) {
      headers.addAll(_headers);
    }

    final modifiedRequest = request.copyWith(headers: headers);
    return chain.proceed(modifiedRequest);
  }
}
