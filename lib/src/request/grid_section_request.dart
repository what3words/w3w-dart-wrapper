import 'package:what3words/src/request/coordinate.dart';
import 'package:what3words/src/response/response.dart';

import 'request.dart';
import 'abstract_builder.dart';
import '../response/grid_section.dart';
import '../service/what3words_v3.dart';

class GridSectionRequest extends Request<GridSection> {
  final String boundingBox;

  GridSectionRequest._builder(GridSectionRequestBuilder builder)
      : boundingBox = builder._boundingBox,
        super(builder.api);

  Future<Response<GridSection>> execute() async {
    return await super
        .call(api.what3words().gridSection, [boundingBox]);
  }
}

/// Builder for `grid-section` API requests
class GridSectionRequestBuilder extends AbstractBuilder<Future<Response<GridSection>>> {
  final String _boundingBox;

  GridSectionRequestBuilder(What3WordsV3 api, Coordinates southwest, Coordinates northeast)
      : _boundingBox =
            '${southwest.lat},${southwest.lng},${northeast.lat},${northeast.lng}',
        super(api);

  ///Execute the API call as represented by the values set within this [GridSectionRequestBuilder]
  ///
  ///return an [Future<GridSection>] representing the response from the what3words API
  @override
  Future<Response<GridSection>> execute() {
    return GridSectionRequest._builder(this).execute();
  }
}
