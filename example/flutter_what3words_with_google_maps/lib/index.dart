import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                MainButton(
                  icon: Icons.location_searching,
                  text: "Convert To Coordinates",
                  link: "/convert_to_coordinates",
                ),
                MainButton(
                  icon: Icons.pin_drop,
                  text: "Convert To 3WA",
                  link: "/convert_to_3wa",
                ),
                MainButton(
                  icon: Icons.grid_3x3,
                  text: "3WA Grid",
                  link: "/grid_section_test",
                ),
                MainButton(
                  icon: Icons.comment_outlined,
                  text: "AutoSuggestion",
                  link: "/autosuggestion",
                )
              ],
            )));
  }
}

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key, required this.text, required this.icon, required this.link})
      : super(key: key);

  final String text;
  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: <Widget>[
        Icon(icon, size: 55.0, color: Colors.grey),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 30),
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              )),
        )
      ]),
      onTap: () => Navigator.of(context).pushNamed(link),
    );
  }
}
