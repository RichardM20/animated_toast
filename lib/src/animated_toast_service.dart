import 'package:animated_toast/src/widgets/animated_toast_widget.dart';
import 'package:flutter/material.dart';

import './exports.dart';

/// A class that provides methods to display animated toast messages.
enum AnimatedToastStartOf { top, bottom, left, right }

abstract class AnimatedToast {
  /// Displays an animated toast message.
  ///
  /// This method inserts an overlay entry into the given [context] to show
  /// a toast message with various customizable options.
  ///
  /// **Methods:**
  ///
  /// - [show]: Displays a toast message with the specified parameters.
  /// - [simpleAnimation]: Remove the first animation to display a simple toast message.
  ///
  ///
  /// **Parameters:**
  /// - [key]: An optional key for the toast widget.
  /// - [context]: The build context in which to display the toast.
  /// - [messageData]: The data for the message to be displayed.
  /// - [position]: The position on the screen where the toast should appear.
  /// - [size]: An optional size for the toast.
  /// - [animationAlignment]: The alignment for the start of the animation. Defaults to [AnimatedToastStartOf.top].
  /// - [style]: An optional style for the toast.
  /// - [duration]: The duration for which the toast should be displayed. Defaults to 300 milliseconds.
  /// - [onDimiss]: An optional callback that is called when the toast is dismissed.
  ///
  /// **Important:**
  /// When you provide an `Animated Toast StartOf` value
  /// this value must be the same as the value of the `position` parameter.
  ///
  /// Example usage:
  /// ```dart
  /// AnimatedToast.show(
  ///   context: context,
  ///   messageData: MessageData(title: 'Hello, World!'),
  /// );
  /// ```
  ///
  /// ```
  /// AnimatedToast.simpleAnimation(
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
    void Function()? onDismiss,
  }) {
    final OverlayState overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return ToastWidget(
          simpleAnimation: false,
          key: key,
          position: position,
          overlayEntry: overlayEntry,
          duration: duration,
          messageData: messageData,
          size: size,
          animationAlignment: animationAlignment,
          style: style,
          onDismiss: onDismiss,
        );
      },
    );

    overlay.insert(overlayEntry);
  }

  /// Displays a simple animated toast message without the first animation.
  static void simpleAnimation({
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
    void Function()? onDismiss,
  }) {
    final OverlayState overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return ToastWidget(
          simpleAnimation: true,
          key: key,
          position: position,
          overlayEntry: overlayEntry,
          duration: duration,
          messageData: messageData,
          size: size,
          animationAlignment: animationAlignment,
          style: style,
          onDismiss: onDismiss,
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}
