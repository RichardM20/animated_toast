# Animated Toast for Flutter

Animated Toast is a Flutter package that provides highly customizable and animated toast messages for your Flutter applications.

## 🚀 Features

- 🎨 Fully customizable in appearance and behavior.
- 🔄 Smooth animations with configurable directions (top, bottom, left, right).
- 📍 Flexible positioning on the screen.
- ⏳ Configurable display duration.
- 🛠️ Easy to implement and use.

## 📦 Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  animated_toast: ^1.0.0
```

Then, run the following command to install the package:

```sh
flutter pub get
```

## 📝 Usage

Import the package in your Dart file:

```dart
import 'package:animated_toast/animated_toast.dart';
```

### Show a Toast

```dart
AnimatedToast.show(
  context: context,
  messageData: MessageData(
    title: 'Success',
    subtitle: 'Operation completed successfully.',
  ),
);
```

### Advanced Options

You can customize the position, style, and duration of the toast:

```dart
AnimatedToast.show(
  context: context,
  messageData: MessageData(
    title: 'Warning',
    subtitle: 'Check the details before proceeding.',
  ),
  position: AnimatedToastPosition(top: true),
  animationAlignment: AnimatedToastStartOf.bottom,
  duration: AnimatedToastDuration(
    begin: Duration(milliseconds: 500),
    displayDuration: Duration(seconds: 1),
  ),
);
```

## 📌 `AnimatedToast.show` API

### Parameters:

- `context` *(required)*: Context in which the toast will be displayed.
- `messageData` *(required)*: Content of the toast message.
- `position` *(optional)*: Position on the screen.
- `size` *(optional)*: Size of the toast.
- `animationAlignment` *(optional)*: Animation start direction (default: `AnimatedToastStartOf.top`).
- `style` *(optional)*: Custom style.
- `duration` *(optional)*: Animation duration (default: `300ms`).

## 🤝 Contributions

Contributions are welcome! If you have ideas or improvements, open an issue or submit a pull request on [GitHub](https://github.com/RichardM20/animated_toast).

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## 📬 Contact

For questions or suggestions, contact us at [[richardoficial2020@gmail.com](mailto\:richardoficial2020@gmail.com)].
