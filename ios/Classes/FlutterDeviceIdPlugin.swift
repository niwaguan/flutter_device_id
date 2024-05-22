import Flutter
import UIKit

public class FlutterDeviceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_device_id", binaryMessenger: registrar.messenger())
    let instance = FlutterDeviceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDeviceId":
        result(UIDevice.current.identifierForVendor?.uuidString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
