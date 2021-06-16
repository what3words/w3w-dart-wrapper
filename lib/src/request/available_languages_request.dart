import '../response/response.dart';

import 'request.dart';
import 'abstract_builder.dart';
import '../response/language.dart';
import '../service/what3words_v3.dart';

class AvailableLanguagesRequest extends Request<Language> {
  AvailableLanguagesRequest._builder(AvailableLanguagesRequestBuilder builder)
      : super(builder.api);

  Future<Response<Language>> execute() async {
    return await super
        .call(api.what3words().availableLanguages, []);
  }
}

/// Builder for `available-languages` API requests
class AvailableLanguagesRequestBuilder
    extends AbstractBuilder<Future<Response<Language>>> {
  AvailableLanguagesRequestBuilder(What3WordsV3 api) : super(api);

  ///Execute the API call as represented by the values set within this [AvailableLanguagesRequestBuilder]
  ///
  ///return an [Future<Language>] representing the response from the what3words API
  @override
  Future<Response<Language>> execute() {
    return AvailableLanguagesRequest._builder(this).execute();
  }
}
