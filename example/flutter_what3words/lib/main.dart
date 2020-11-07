import 'package:flutter/material.dart';
import 'package:what3words/what3words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'what3words';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: LocationForm(),
      ),
    );
  }
}

class LocationForm extends StatefulWidget {
  @override
  LocationFormState createState() {
    return LocationFormState();
  }
}

class LocationFormState extends State<LocationForm> {
  String twaHolder = '';
  var api = What3WordsV3('what3words-api-key');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var twaController = TextEditingController();
    var twaInput = TextFormField(
      controller: twaController,
      decoration: InputDecoration(
          hintText: "e.g. lock.spout.radar"
      ),
    );

    var convertToCoordsButton = ElevatedButton(
      child: Text("Convert To Coordinates"),
      onPressed: () async {
        var location = await api.convertToCoordinates(twaController.text).execute();
        setState(() {
          if (location.isSuccessful()) {
            twaHolder = '${location.coordinates.lat}, ${location.coordinates.lng}';
          } else {
            twaHolder = '${location.getError().code}: ${location.getError().message}';
          }
        });
      },
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          twaInput,
          convertToCoordsButton,
          Text('$twaHolder', style: TextStyle(fontSize: 21))
        ],
      ),
    );
  }
}