// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what3words/what3words.dart';

class _AutoSuggestionPageState extends State<AutoSuggestionPage> {
  late GoogleMapController mapController;
  late MapType _defaultMapType = MapType.normal;
  late TextEditingController _twaController;
  late String errorMessage;
  final Set<Marker> _markers = {};
  final api = What3WordsV3('W3W_API_KEY');
  String twaHolder = '';
  bool isAnError = true;
  List<String> suggestedWordList = [];
  bool _visible = false;

  static const _initialPosition = CameraPosition(
    target: LatLng(51.520847, -0.195521),
    zoom: 17,
  );

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

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
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

  Future<void> suggestLocations() async {
    _visible = false;
    final autosuggest = await api
        .autosuggest(_twaController.text,
            options: AutosuggestOptions().setNResults(3))
        .execute();

    if (autosuggest.isSuccessful()) {
      // print('Autosuggest: ${autosuggest.data()?.toJson()}');
      final locationJsonList = autosuggest.data()?.toJson();
      final suggestionList = locationJsonList!['suggestions'] as List;
      if (suggestionList != []) {
        suggestedWordList = [];
        for (var suggestion in suggestionList) {
          var suggestedWord = suggestion['words'];
          setState(() {
            _visible = true;
            suggestedWordList.add(
                suggestedWord); // country, nearestPlace, distanceToFocusKm, rank, language
          });
        }
        print(suggestedWordList);
      }
    } else {
      final error = autosuggest.error();
      print(error);
    }
  }

  void onButtonPressed(String buttonValue) {
    print('You clicked $buttonValue');
    _visible = false;
    _twaController.text = buttonValue;
    covertToCoordinates();
  }

  List<Widget> _createChildren() {
    print(_visible);
    return List<Widget>.generate(suggestedWordList.length, (int index) {
      return OutlinedButton(
          style: const ButtonStyle(alignment: Alignment.centerLeft),
          onPressed: () {
            onButtonPressed(suggestedWordList[index].toString());
          },
          child: Text(
            '///' + suggestedWordList[index].toString(),
            style: const TextStyle(color: Colors.black, fontSize: 15.0),
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
        // print(twaHolder);
        addMarker(mLatLng, mTitle, mDescription);
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: mLatLng, zoom: 17)));
      } else {
        twaHolder = '${location.error()?.code}: ${location.error()?.message}';
        // print(twaHolder);
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
    foregroundColor: Colors.blue,  // Replaces 'onPrimary'
    backgroundColor: Colors.blue[100],  // Replaces 'primary'
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
                    suggestLocations();
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
        Visibility(
            visible: _visible,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 120, 10, 50),
              height: 135,
              color: Colors.white,
              child: ListView(
                // padding: const EdgeInsets.all(10.0),
                itemExtent: 45.0,
                children: _createChildren(),
              ),
            ))
      ],
    )));
  }
}

class AutoSuggestionPage extends StatefulWidget {
  const AutoSuggestionPage({Key? key}) : super(key: key);

  @override
  _AutoSuggestionPageState createState() => _AutoSuggestionPageState();
}
