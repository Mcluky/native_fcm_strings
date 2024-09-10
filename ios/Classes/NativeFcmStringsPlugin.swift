import Flutter
import UIKit

public class NativeFcmStringsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_fcm_strings", binaryMessenger: registrar.messenger())
    let instance = NativeFcmStringsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getString":
      if let key = call.arguments as? String {
          let localizedString = NSLocalizedString(key, comment: "")
          result(localizedString)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid key", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
