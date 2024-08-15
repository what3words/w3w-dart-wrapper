// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what3words/what3words.dart';

class _ConvertToCoordinatesPageState extends State<ConvertToCoordinatesPage> {
  late GoogleMapController mapController;
  late TextEditingController _twaController;
  late String errorMessage;
  late MapType _defaultMapType = MapType.normal;
  final Set<Marker> _markers = {};
  final api = What3WordsV3('W3W_API_KEY');
  String twaHolder = '';
  bool isAnError = true;

  static const _initialPosition = CameraPosition(
    target: LatLng(51.520847, -0.195521),
    zoom: 17,
  );

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    super.initState();
    _twaController = TextEditingController();
    _twaController.addListener(() {
      _twaController.text;
    });
  }

  @override
  void dispose() {
    _twaController.dispose();
    super.dispose();
  }

  void addMarker(LatLng mLatLng, String mTitle, String mDescription) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId:
            MarkerId((mTitle + "_" + _markers.length.toString()).toString()),
        position: mLatLng,
        infoWindow: InfoWindow(
          title: mTitle,
          snippet: mDescription,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Future<void> covertToCoordinates() async {
    final location =
        await api.convertToCoordinates(_twaController.text).execute();
    setState(() {
      _markers.clear();

      if (location.isSuccessful()) {
        // print(location);
        double latitude = location.data()!.coordinates.lat;
        double longitude = location.data()!.coordinates.lng;
        LatLng mLatLng = LatLng(latitude, longitude);
        String mTitle = '///${location.data()?.words}';
        String mDescription =
            'Coordinates: ${location.data()?.coordinates.lat}, ${location.data()?.coordinates.lng},\nNearest Place: ${location.data()?.nearestPlace}';
        twaHolder =
            '${location.data()?.coordinates.lat}, ${location.data()?.coordinates.lng}';
        print(twaHolder);
        addMarker(mLatLng, mTitle, mDescription);
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: mLatLng, zoom: 17)));
      } else {
        twaHolder = '${location.error()?.code}: ${location.error()?.message}';
        print(twaHolder);
      }
    });
  }

  void setValidator(valid) {
    setState(() {
      if (twaHolder.isNotEmpty) {
        isAnError = valid;
      }
    });
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Use 'backgroundColor' instead of 'primary'
    minimumSize: const Size(58, 58),
    padding: const EdgeInsets.symmetric(horizontal: 10),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: _defaultMapType,
            compassEnabled: true,
            cameraTargetBounds: CameraTargetBounds.unbounded,
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: _initialPosition,
            onMapCreated: _onMapCreated,
            markers: _markers,
            
          ),
          Container(
            margin: const EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                    child: const Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: Colors.teal[200],
                    onPressed: () {
                      _changeMapType();
                      print('Changing the Map Type');
                    }),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _twaController,
                    onChanged: (value) {
                      // print(value);
                      covertToCoordinates();
                      if (value.isEmpty) {
                        setValidator(true);
                      } else {
                        setValidator(false);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'e.g. daring.lion.race',
                      errorText: isAnError ? null : twaHolder,
                      errorMaxLines: 5,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      covertToCoordinates();
                    },
                    child: const Icon(
                      Icons.pin_drop,
                      size: 30.0,
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class ConvertToCoordinatesPage extends StatefulWidget {
  const ConvertToCoordinatesPage({Key? key}) : super(key: key);

  @override
  _ConvertToCoordinatesPageState createState() =>
      _ConvertToCoordinatesPageState();
}
