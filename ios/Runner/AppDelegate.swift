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
    
    GMSServices.provideAPIKey("AIzaSyCW4VpMQJBavNd1i0dkc5gmUXt2tUW9JY8")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
