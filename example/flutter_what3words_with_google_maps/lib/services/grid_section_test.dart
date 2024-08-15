// NOTE
// this test grid contained hard-coded 20 polylines to not consume the API

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geojson/geojson.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart' show rootBundle;

class _GridSectionPageState extends State<GridSectionPage> {
  final multilines = <Polyline>[];

  @override
  void initState() {
    processData();
    super.initState();
  }

  Future<void> processData() async {
    // data is from http://www.naturalearthdata.com
    final geojson = GeoJson();
    final data = await rootBundle.loadString('assets/grid.geojson');
    // await geojson.parse(data, verbose: true);

    geojson.processedMultiLines.listen((GeoJsonMultiLine line) {
      print("2");
      print(line);
      print("3");
      setState(() => multilines
          .add(Polyline(strokeWidth: 2.0, color: Colors.red, points: [])));
      print("4");
    });
    print("5");
    print(multilines);
    geojson.endSignal.listen((_) => geojson.dispose());
    unawaited(geojson.parse(data, verbose: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        center: LatLng(51.520847, -0.195521),
        zoom: 15,
      ),
      children: [
        TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          PolylineLayer(
            polylines: multilines,
          ),
      ],
    ));
  }
}

class GridSectionPage extends StatefulWidget {
  const GridSectionPage({Key? key}) : super(key: key);

  @override
  _GridSectionPageState createState() => _GridSectionPageState();
}
