// NOTE
// this test grid contained hard-coded 20 polylines to not consume the API


import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class _GridSectionPageState extends State<GridSectionPage> {
  late Jsons dataSource;
  late List<DataModel> data;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    data = <DataModel>[
      DataModel(const MapLatLng(51.515901250539024, -0.212517),
          const MapLatLng(51.515901250539024, -0.191746)),
      DataModel(const MapLatLng(51.51592820181112, -0.212517),
          const MapLatLng(51.51592820181112, -0.191746)),
      DataModel(const MapLatLng(51.51595515308322, -0.212517),
          const MapLatLng(51.51595515308322, -0.191746)),
      DataModel(const MapLatLng(51.51598210435532, -0.212517),
          const MapLatLng(51.51598210435532, -0.191746)),
      DataModel(const MapLatLng(51.516009055627414, -0.212517),
          const MapLatLng(51.516009055627414, -0.191746)),
      DataModel(const MapLatLng(51.51603600689951, -0.212517),
          const MapLatLng(51.51603600689951, -0.191746)),
      DataModel(const MapLatLng(51.51606295817161, -0.212517),
          const MapLatLng(51.51606295817161, -0.191746)),
      DataModel(const MapLatLng(51.5159, -0.19216094346167314),
          const MapLatLng(51.527649, -0.19216094346167314)),
      DataModel(const MapLatLng(51.5159, -0.1921175858480762),
          const MapLatLng(51.527649, -0.1921175858480762)),
      DataModel(const MapLatLng(51.5159, -0.19207422823447926),
          const MapLatLng(51.527649, -0.19207422823447926)),
      DataModel(const MapLatLng(51.5159, -0.1920308706208823),
          const MapLatLng(51.527649, -0.1920308706208823)),
      DataModel(const MapLatLng(51.5159, -0.19198751300728537),
          const MapLatLng(51.527649, -0.19198751300728537)),
      DataModel(const MapLatLng(51.5159, -0.19194415539368842),
          const MapLatLng(51.527649, -0.19194415539368842)),
      DataModel(const MapLatLng(51.5159, -0.19190079778009148),
          const MapLatLng(51.527649, -0.19190079778009148)),
    ];

    _zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: const MapLatLng(51.51603441445314, -0.19206393510103228),
      zoomLevel: 18,
      showToolbar: true,
      toolbarSettings: const MapToolbarSettings(
        position: MapToolbarPosition.topLeft,
        iconColor: Colors.red,
        itemBackgroundColor: Colors.green,
        itemHoverColor: Colors.blue,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfMaps(layers: [
        MapTileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          zoomPanBehavior: _zoomPanBehavior,
          sublayers: [
            MapLineLayer(
              lines: List<MapLine>.generate(data.length, (int index) {
                return MapLine(
                  from: data[index].from,
                  to: data[index].to,
                );
              }).toSet(),
            ),
          ],
        ),
      ]),
    );
  }
}

class GridSectionPage extends StatefulWidget {
  const GridSectionPage({Key? key}) : super(key: key);

  @override
  _GridSectionPageState createState() => _GridSectionPageState();
}

class Jsons {
  static var gridListJson = {
    "lines": [
      {
        "start": {"lng": -0.212517, "lat": 51.515901250539024},
        "end": {"lng": -0.191746, "lat": 51.515901250539024}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.51592820181112},
        "end": {"lng": -0.191746, "lat": 51.51592820181112}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.51595515308322},
        "end": {"lng": -0.191746, "lat": 51.51595515308322}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.51598210435532},
        "end": {"lng": -0.191746, "lat": 51.51598210435532}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.516009055627414},
        "end": {"lng": -0.191746, "lat": 51.516009055627414}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.51603600689951},
        "end": {"lng": -0.191746, "lat": 51.51603600689951}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.51606295817161},
        "end": {"lng": -0.191746, "lat": 51.51606295817161}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.51608990944371},
        "end": {"lng": -0.191746, "lat": 51.51608990944371}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.516116860715805},
        "end": {"lng": -0.191746, "lat": 51.516116860715805}
      },
      {
        "start": {"lng": -0.212517, "lat": 51.5161438119879},
        "end": {"lng": -0.191746, "lat": 51.5161438119879}
      },
      {
        "start": {"lng": -0.19216094346167314, "lat": 51.5159},
        "end": {"lng": -0.19216094346167314, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.1921175858480762, "lat": 51.5159},
        "end": {"lng": -0.1921175858480762, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19207422823447926, "lat": 51.5159},
        "end": {"lng": -0.19207422823447926, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.1920308706208823, "lat": 51.5159},
        "end": {"lng": -0.1920308706208823, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19198751300728537, "lat": 51.5159},
        "end": {"lng": -0.19198751300728537, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19194415539368842, "lat": 51.5159},
        "end": {"lng": -0.19194415539368842, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19190079778009148, "lat": 51.5159},
        "end": {"lng": -0.19190079778009148, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19185744016649453, "lat": 51.5159},
        "end": {"lng": -0.19185744016649453, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19181408255289759, "lat": 51.5159},
        "end": {"lng": -0.19181408255289759, "lat": 51.527649}
      },
      {
        "start": {"lng": -0.19177072493930064, "lat": 51.5159},
        "end": {"lng": -0.19177072493930064, "lat": 51.527649}
      }
    ]
  };
}

class DataModel {
  DataModel(this.from, this.to);

  final MapLatLng from;
  final MapLatLng to;
}
