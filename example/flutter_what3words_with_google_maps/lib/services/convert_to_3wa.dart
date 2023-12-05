import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what3words/what3words.dart';

class _ConvertTo3WAPageState extends State<ConvertTo3WAPage> {
  late GoogleMapController mapController;
  late MapType _defaultMapType = MapType.normal;
  final Set<Marker> _markers = {};
  final api = What3WordsV3('08L3S2A9');

  static const _initialPosition = CameraPosition(
    target: LatLng(51.520847, -0.195521),
    zoom: 17,
  );

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: <Widget>[
        GoogleMap(
          mapType: _defaultMapType,
          compassEnabled: true,
          minMaxZoomPreference: MinMaxZoomPreference.unbounded,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: _initialPosition,
          onMapCreated: _onMapCreated,
          markers: _markers,
          onTap: _handleTap,
        ),
        Container(
          margin: const EdgeInsets.only(top: 80, right: 10),
          alignment: Alignment.bottomRight,
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
          height: 50,
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Hello, Click on the map to get \n your 3 word address!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
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

  Future<void> _handleTap(LatLng tappedPoint) async {
    print(tappedPoint);
    final words = await api
        .convertTo3wa(Coordinates(tappedPoint.latitude, tappedPoint.longitude))
        .language('en')
        .execute();
    print(words.data()!.words);
    LatLng mLatLng = tappedPoint;
    String mTitle = '///${words.data()!.words}';
    String mDescription =
        'Coordinates: ${words.data()!.coordinates.lat}, ${words.data()!.coordinates.lng},\nNearest Place: ${words.data()!.nearestPlace}';

    setState(() {
      _markers.clear();
      if (words.isSuccessful()) {
        addMarker(mLatLng, mTitle, mDescription);
      } else {
        print(words.error());
      }
    });
  }
}

class ConvertTo3WAPage extends StatefulWidget {
  const ConvertTo3WAPage({Key? key}) : super(key: key);

  @override
  _ConvertTo3WAPageState createState() => _ConvertTo3WAPageState();
}
