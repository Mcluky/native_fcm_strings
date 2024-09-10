import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NativeFcmStringsMethodChannel {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_fcm_strings');

  Future<String?> getString({required String titleLocKey}) =>
      methodChannel.invokeMethod<String>('getString', titleLocKey);
}
