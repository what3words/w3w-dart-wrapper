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
      decoration: InputDecoration(hintText: 'e.g. lock.spout.radar'),
    );

    var convertToCoordsButton = ElevatedButton(
      onPressed: () async {
        var location =
            await api.convertToCoordinates(twaController.text).execute();
        setState(() {
          if (location.isSuccessful()) {
            twaHolder =
                '${location.data()!.coordinates.lat}, ${location.data()!.coordinates.lng}';
          } else {
            twaHolder =
                '${location.error()!.code}: ${location.error()!.message}';
          }
        });
      },
      child: Text('Convert To Coordinates'),
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          twaInput,
          convertToCoordsButton,
          Text(twaHolder, style: TextStyle(fontSize: 21))
        ],
      ),
    );
  }
}
