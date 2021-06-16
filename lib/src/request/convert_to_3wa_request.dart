import 'package:what3words/src/response/response.dart';

import '../response/location.dart';
import 'coordinate.dart';
import 'abstract_builder.dart';
import '../service/what3words_v3.dart';
import 'request.dart';

class ConvertTo3WARequest extends Request<Location> {
  final String coordinates;
  final String? language;

  ConvertTo3WARequest._builder(ConvertTo3WARequestBuilder builder)
      : coordinates = builder._coordinates,
        language = builder._language,
        super(builder.api);

  Future<Response<Location>> execute() async {
    return await super.call(
        api.what3words().convertTo3wa, [coordinates, language]);
  }
}

/// Builder for `convert-to-3wa` API requests
class ConvertTo3WARequestBuilder extends AbstractBuilder<Future<Response<Location>>> {
  final String _coordinates;
  String? _language;

  ConvertTo3WARequestBuilder(What3WordsV3 api, Coordinates coordinates)
      : _coordinates = '${coordinates.lat}, ${coordinates.lng}',
        super(api);

  ///Set the language to return the 3 word address in
  ///
  ///[language] the 3 word address language
  ///
  ///Returns an [ConvertTo3WARequestBuilder] instance suitable for invoking an `convert-to-3wa` API request
  ConvertTo3WARequestBuilder language(String language) {
    _language = language;
    return this;
  }

  ///Execute the API call as represented by the values set within this [ConvertTo3WARequestBuilder]
  ///
  ///return an [Future<Location>] representing the response from the what3words API
  @override
  Future<Response<Location>> execute() {
    return ConvertTo3WARequest._builder(this).execute();
  }
}
