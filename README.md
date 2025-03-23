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

## 📤 Uploading to GitHub

To upload your project to GitHub, follow these steps:

1. **Initialize a Git repository** (if you haven't already):

    ```sh
    git init
    ```

2. **Add your files to the repository**:

    ```sh
    git add .
    ```

3. **Commit your changes**:

    ```sh
    git commit -m "Initial commit"
    ```

4. **Create a new repository on GitHub**. Go to [GitHub](https://github.com) and create a new repository.

5. **Add the remote repository URL**:

    ```sh
    git remote add origin https://github.com/your-username/your-repository.git
    ```

6. **Push your changes to GitHub**:

    ```sh
    git push -u origin master
    ```

Replace `your-username` and `your-repository` with your GitHub username and the name of your repository.