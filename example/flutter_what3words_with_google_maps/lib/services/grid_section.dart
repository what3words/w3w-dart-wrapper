// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what3words/what3words.dart';

class _GridSectionPageState extends State<GridSectionPage> {
  late GoogleMapController mapController;
  final api = What3WordsV3('08L3S2A9');
  List<Polyline> polylines = [];

  static const _initialPosition = CameraPosition(
    target: LatLng(51.520847, -0.195521),
    zoom: 30,
  );

  What3WordsError? gridDataError;

  // @override
  // void initState() {
  //   super.initState();
  //   // _createGrid();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  Future<void> _createGrid(value) async {
    final gridSection = await api
        .gridSection(
            Coordinates(value.southwest.latitude, value.southwest.longitude),
            Coordinates(value.northeast.latitude, value.northeast.longitude))
        .execute();
    if (gridSection.isSuccessful()) {
      var gridData = gridSection.data()?.toJson();
      if (gridData!['lines'] != null) {
        var gridDataLines = gridData['lines'] as List;
        // print(gridDataLines);

        List<LatLng> polylineCoordinates = [];
        for (var line in gridDataLines) {
          print(line);

          try {
            LatLng start = LatLng(line['start']['lat'], line['start']['lng']);
            LatLng end = LatLng(line['end']['lat'], line['end']['lng']);
            polylineCoordinates.add(start);
            polylineCoordinates.add(end);

            setState(() {
              polylines.add(Polyline(
                  width: 2, // set the width of the polylines
                  polylineId: const PolylineId("poly"),
                  color: const Color.fromARGB(255, 40, 122, 198),
                  points: polylineCoordinates));
            });
          } catch (e) {
            print("Ex--- $e");
          }
          // break;
        }
        print(polylines.length);
        print(polylineCoordinates);
      }
    } else {
      gridDataError = gridSection.error();
      print(gridDataError);
    }
  }

  Future<void> _onCameraMove(position) async {
    // print(position.target);
    final currentPosition = position.target;
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: currentPosition, zoom: 30)))
        .then((_) async {
      await mapController.getVisibleRegion().then((value) {
        // print(value);
        _createGrid(value);
      });
    });
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: true,
      initialCameraPosition: _initialPosition,
      onMapCreated: _onMapCreated,
      onCameraMove: _onCameraMove,
      polylines: polylines.toSet(),
    ));
  }
}

class GridSectionPage extends StatefulWidget {
  const GridSectionPage({Key? key}) : super(key: key);

  @override
  _GridSectionPageState createState() => _GridSectionPageState();
}
