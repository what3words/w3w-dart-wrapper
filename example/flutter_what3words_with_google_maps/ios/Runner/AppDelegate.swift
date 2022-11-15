import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyA1wNwjAbxg5-oFGA13njgaJwJW0VfpsOQ")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
