Developed with 💚 by [netglade][netglade_link]

[![ci][ci_badge]][ci_badge_link]
[![native_fcm_strings][native_fcm_strings_pub_badge]][native_fcm_strings_pub_badge_link]
[![license: MIT][license_badge]][license_badge_link]
[![style: netglade analysis][style_badge]][style_badge_link]
[![Discord][discord_badge]][discord_badge_link]

---

# Native FCM Strings Plugin

This Flutter plugin provides a simple way to access localized strings from native Android and iOS resources, such as `strings.xml` (Android) and `.strings` files (iOS). It allows Flutter applications to retrieve the correct localized strings based on the system language settings, ensuring consistency across both native and Flutter parts of the app.

## Features

- Access Android's `strings.xml` resources based on the system language.
- Access iOS `.strings` resources (via `.lproj` folders) based on the system language.
- Use the same localization files used by native Android and iOS notifications, avoiding duplication of localization files for Flutter.
- Supports dynamic language switching based on device locale.

## Installation

1. Add the plugin to your `pubspec.yaml` file:
    ```yaml
    dependencies:
      native_fcm_strings: ^1.0.0
    ```

2. Run `flutter pub get` to install the package.

## Usage

### Accessing Native Strings in Flutter

```dart
import 'package:native_fcm_strings/native_fcm_strings.dart';

// Example usage
String localizedTitle = await NativeStrings.getTranslatedString(key: 'notification_title', locArgs: ['John', 'Doe']); // Returns: Message from John to Doe
String localizedBody = await NativeStrings.getTranslatedString(key: 'notification_body', locArgs: ['John', 'Doe']); // Returns: Message from John to Doe
``` 

This will retrieve the localized string from the appropriate native resources (strings.xml for Android or .strings for iOS) based on the current device locale.

## Android Setup
Ensure that your strings.xml files are properly placed in language-specific folders under res/values (e.g., res/values-en, res/values-cs).

Arguments in localized strings has to be in format `%1$s`, e.g `Message from %1$s to %2$s`.

## iOS Setup
Ensure that your .strings files are placed under language-specific .lproj folders (e.g., en.lproj, cs.lproj).

Arguments in localized strings has to be in format `%1$@`, e.g `Message from %1$@ to %2$@.`

## 👏 Contributing

Your contributions are always welcome! Feel free to open pull request.

[netglade_link]: https://netglade.com/en
[ci_badge]: https://github.com/netglade/native_fcm_strings/actions/workflows/ci.yaml/badge.svg
[ci_badge_link]: https://github.com/netglade/native_fcm_strings/actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_badge_link]: https://opensource.org/licenses/MIT
[style_badge]: https://img.shields.io/badge/style-netglade_analysis-26D07C.svg
[style_badge_link]: https://pub.dev/packages/netglade_analysis
[native_fcm_strings_pub_badge]: https://img.shields.io/pub/v/native_fcm_strings.svg
[native_fcm_strings_pub_badge_link]: https://pub.dartlang.org/packages/native_fcm_strings
[discord_badge]: https://img.shields.io/discord/1091460081054400532.svg?logo=discord&color=blue
[discord_badge_link]: https://discord.gg/sJfBBuDZy4
