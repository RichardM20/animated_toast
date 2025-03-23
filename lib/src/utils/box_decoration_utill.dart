import 'package:animated_toast/src/models/toast_decoration_styles.dart';
import 'package:flutter/material.dart';

/// A utility class that builds [BoxDecoration] for toast widgets.
///
/// This class handles the logic for creating appropriate decorations
/// based on the toast's state and style preferences.
class ToastBoxDecorationBuilder {
  static const double _defaultExpandedBorderRadius = 38.0;

  static const double _defaultCollapsedBorderRadius = 100.0;

  static const Color _defaultShadowColor = Color(0xFFEEEEEE);

  /// Default background color for the toast when not expanded
  static const Color _defaultInitialColor = Colors.blueAccent;

  /// Default background color for the toast when expanded
  static const Color _defaultFinalColor = Colors.white;

  /// Default shadow configuration for the toast
  static final List<BoxShadow> _defaultBoxShadow = [
    const BoxShadow(
      color: _defaultShadowColor,
      blurRadius: 2,
      spreadRadius: 2,
      offset: Offset.zero,
    ),
  ];

  /// Builds a [BoxDecoration] based on the toast's state and style.
  ///
  /// [isExpanded] determines whether the toast is in its expanded state.
  /// [style] provides custom styling options that override the defaults.
  static BoxDecoration build({
    required bool isExpanded,
    AnimatedToastBoxDecoration? style,
  }) {
    final defaultBorderRadius = BorderRadius.circular(
      isExpanded ? _defaultExpandedBorderRadius : _defaultCollapsedBorderRadius,
    );
    final borderRadius = style?.borderRadius ?? defaultBorderRadius;

    final boxShadow = style?.boxShadow ?? _defaultBoxShadow;

    Color backgroundColor;

    if (style?.color != null) {
      backgroundColor = style!.color!;
    } else {
      final initialColor =
          style?.initialBackgroundColor ?? _defaultInitialColor;
      final finalColor = style?.finalBackgroundColor ?? _defaultFinalColor;

      backgroundColor = isExpanded ? finalColor : initialColor;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      backgroundBlendMode: style?.backgroundBlendMode,
      border: style?.border,
      gradient: style?.gradient,
      image: style?.image,
    );
  }
}
