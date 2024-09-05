import 'package:what3words/src/response/response.dart';

import '../response/location.dart';
import 'abstract_builder.dart';
import 'request.dart';

class ConvertToCoordinatesRequest extends Request<Location> {
  final String words;

  ConvertToCoordinatesRequest._builder(
      ConvertToCoordinatesRequestBuilder builder)
      : words = builder._words,
        super(builder.api);

  Future<Response<Location>> execute() async {
    return await super
        .call(api.what3words().convertToCoordinates, [words]);
  }
}

/// Builder for `convert-to-coordinates` API requests
class ConvertToCoordinatesRequestBuilder
    extends AbstractBuilder<Future<Response<Location>>> {
  final String _words;

  ConvertToCoordinatesRequestBuilder(super.api, this._words);

  ///Execute the API call as represented by the values set within this [ConvertToCoordinatesRequestBuilder]
  ///
  ///return an [Future<Location>] representing the response from the what3words API
  @override
  Future<Response<Location>> execute() {
    return ConvertToCoordinatesRequest._builder(this).execute();
  }
}
