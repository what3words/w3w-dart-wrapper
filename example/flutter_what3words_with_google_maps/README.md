# w3w_google_flutter

![what3words with google maps in Flutter](./assets/flutter_what3words_google_maps.png)

A sample of a Flutter application with Google Maps as a basemap is available in this [FlutLab project](https://flutlab.io/editor/cebfba35-f9bd-4662-bc9d-bb7aa41bdd62).

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to run this code

Make sure that you have installed Flutter on your computer

Type on your terminal this command to grab all the flutter packages

```sh
flutter pub get
```

Then run it on your terminal using this command

```sh
flutter run
```

I use the ios simulator to simulate how it would look like on your phones.

## Troubleshooting

To clean any builds that flutter created after lunching it, use this command on your terminal

```sh
flutter clean
```

Then grab again the packages and run the project to see if it fixed any curropted builds:

```sh
flutter pub get
flutter run
```

# Google Map API
The application is currently using the a Low Quota Google Map API key. This is a temporary key and is not valid for production usage. It can be replaced by following these instructions to
[get an api key](https://developers.google.com/maps/documentation/javascript/get-api-key).

```sh
GOOGLE_MAPS_API_KEY=AIzaSyDcwGyRxRbcNGWOFQVT87A1mkxEOfm8t0w
```

# Issues
Currently the grid is not plotted correctly on the google maps we are planning to improve it. 

