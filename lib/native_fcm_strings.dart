import 'dart:io';

import 'package:native_fcm_strings/native_fcm_strings_method_channel.dart';

abstract final class NativeFcmStrings {
  static Future<String> getTranslatedString({required String key, List<String> locArgs = const []}) async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      return key;
    }

    final maybeValue = await NativeFcmStringsMethodChannel().getString(titleLocKey: key);

    if (maybeValue == null) return key;

    final title = maybeValue;

    if (Platform.isAndroid) {
      return _processAndroidTitle(androidTitle: title, titleLocArgs: locArgs);
    }

    // Processing iOS
    return _processiOSTitle(iosTitle: title, titleLocArgs: locArgs);
  }

  static String _processAndroidTitle({required String androidTitle, List<String> titleLocArgs = const []}) {
    var title = androidTitle;
    final regex = RegExp(r'(\%\d+\$s)');
    final matches = regex.allMatches(title);

    for (var i = 0; i < matches.length; i++) {
      // ignore: avoid-unsafe-collection-methods, okay to use.
      final match = matches.elementAt(i);
      final group = match.group(1);

      if (group == null) continue;

      if (i > titleLocArgs.length) break;
      // ignore: avoid-unsafe-collection-methods, checked by condition.
      title = title.replaceFirst(group, titleLocArgs[i]);
    }

    return title;
  }

  static String _processiOSTitle({required String iosTitle, List<String> titleLocArgs = const []}) {
    var title = iosTitle;
    final regex = RegExp(r'(\%\d+\$%)');
    final matches = regex.allMatches(title);

    for (var i = 0; i < matches.length; i++) {
      // ignore: avoid-unsafe-collection-methods, okay to use.
      final match = matches.elementAt(i);
      final group = match.group(1);

      if (group == null) continue;

      if (i > titleLocArgs.length) break;
      // ignore: avoid-unsafe-collection-methods, checked by condition.
      title = title.replaceFirst(group, titleLocArgs[i]);
    }

    return title;
  }
}
