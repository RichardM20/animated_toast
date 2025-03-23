import 'package:animated_toast/src/widgets/animated_toast_widget.dart';
import 'package:flutter/material.dart';

import './exports.dart';

enum AnimatedToastStartOf { top, bottom, left, right }

abstract class AnimatedToast {
  /// Displays an animated toast message.
  ///
  /// This method inserts an overlay entry into the given [context] to show
  /// a toast message with various customizable options.
  ///
  /// Parameters:
  /// - [key]: An optional key for the toast widget.
  /// - [context]: The build context in which to display the toast.
  /// - [messageData]: The data for the message to be displayed.
  /// - [position]: The position on the screen where the toast should appear.
  /// - [size]: An optional size for the toast.
  /// - [animationAlignment]: The alignment for the start of the animation. Defaults to [AnimatedToastStartOf.top].
  /// - [style]: An optional style for the toast.
  /// - [duration]: The duration for which the toast should be displayed. Defaults to 300 milliseconds.
  ///
  /// Example usage:
  /// ```dart
  /// AnimatedToast.show(
  ///   context: context,
  ///   messageData: MessageData(title: 'Hello, World!'),
  /// );
  /// ```
  static void show({
    Key? key,
    required BuildContext context,
    required MessageData messageData,
    AnimatedToastPosition position = const AnimatedToastPosition(top: true),
    AnimatedToastSize? size,
    AnimatedToastStartOf animationAlignment = AnimatedToastStartOf.top,
    AnimatedToastStyle? style,
    AnimatedToastDuration duration = const AnimatedToastDuration(
      begin: Duration(milliseconds: 300),
    ),
  }) {
    final OverlayState overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return ToastWidget(
          key: key,
          position: position,
          overlayEntry: overlayEntry,
          duration: duration,
          messageData: messageData,
          size: size,
          animationAlignment: animationAlignment,
          style: style,
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}
