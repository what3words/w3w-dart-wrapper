import 'request.dart';
import 'bounding_box.dart';
import 'abstract_builder.dart';
import '../response/grid_section.dart';
import '../service/what3words_v3.dart';

class GridSectionRequest extends Request<GridSection> {
  final String boundingBox;

  GridSectionRequest._builder(GridSectionRequestBuilder builder)
      : boundingBox = builder._boundingBox,
        super(builder.api);

  Future<GridSection> execute() async {
    return await super
        .call(api.what3words().gridSection, GridSection(), [boundingBox]);
  }
}

/// Builder for `grid-section` API requests
class GridSectionRequestBuilder extends AbstractBuilder<Future<GridSection>> {
  final String _boundingBox;

  GridSectionRequestBuilder(What3WordsV3 api, BoundingBox boundingBox)
      : _boundingBox =
            '${boundingBox.sw.lat},${boundingBox.sw.lng},${boundingBox.ne.lat},${boundingBox.ne.lng}',
        super(api);

  ///Execute the API call as represented by the values set within this [GridSectionRequestBuilder]
  ///
  ///return an [Future<GridSection>] representing the response from the what3words API
  @override
  Future<GridSection> execute() {
    return GridSectionRequest._builder(this).execute();
  }
}
