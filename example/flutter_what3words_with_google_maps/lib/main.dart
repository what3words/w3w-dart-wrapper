import 'package:flutter/material.dart';
import 'services/convert_to_coordinates.dart';
import 'services/convert_to_3wa.dart';
import 'services/grid_section_test.dart';
import 'services/autosuggestion.dart';
import 'index.dart';

final routes = {
  '/convert_to_coordinates': (BuildContext context) =>
      const ConvertToCoordinatesPage(),
  '/convert_to_3wa': (BuildContext context) => const ConvertTo3WAPage(),
  '/grid_section_test': (BuildContext context) => const GridSectionPage(),
  '/autosuggestion': (BuildContext context) => const AutoSuggestionPage(),
};

class W3WApp extends StatelessWidget {
  const W3WApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: const IndexPage(),
      routes: routes,
    );
  }
}

void main() => runApp(const W3WApp());
