import 'package:flutter/material.dart';

class AnimatedToastBoxDecoration extends BoxDecoration {
  /// The background color when the toast is in its initial state (not expanded)
  final Color? initialBackgroundColor;

  /// The background color when the toast is in its expanded state
  final Color? finalBackgroundColor;

  /// A decoration for an animated toast box that extends Flutter `BoxDecoration`
  ///
  /// This class provides additional properties for handling animation states:
  /// - [initialBackgroundColor]: The background color when the toast is in its initial state
  /// - [finalBackgroundColor]: The background color when the toast is in its expanded state
  ///
  /// If a [color] is provided, it will override both the initial and final background colors.
  const AnimatedToastBoxDecoration({
    super.color,
    super.borderRadius,
    super.boxShadow,
    super.border,
    super.gradient,
    super.backgroundBlendMode,
    super.shape,
    super.image,
    this.initialBackgroundColor,
    this.finalBackgroundColor,
  });

  @override
  AnimatedToastBoxDecoration copyWith({
    Color? color,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    BoxBorder? border,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
    DecorationImage? image,
    Color? initialBackgroundColor,
    Color? finalBackgroundColor,
  }) {
    return AnimatedToastBoxDecoration(
      color: color ?? this.color,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      border: border ?? this.border,
      gradient: gradient ?? this.gradient,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shape: shape ?? this.shape,
      image: image ?? this.image,
      initialBackgroundColor:
          initialBackgroundColor ?? this.initialBackgroundColor,
      finalBackgroundColor: finalBackgroundColor ?? this.finalBackgroundColor,
    );
  }
}

class AnimatedToastStyle {
  final AnimatedToastBoxDecoration? boxDecoration;
  final EdgeInsets? padding;
  final double? leftSpacing;
  final AnimatedToastLeadingData? leadingData;

  /// A class that defines the style for an animated toast.
  ///
  /// This class contains properties that allow customization of the appearance
  /// and layout of an animated toast, including box decoration, padding, left
  /// spacing, and leading data.
  ///
  /// Properties:
  /// - [boxDecoration]: An optional `AnimatedToastBoxDecoration` that defines
  ///   the decoration of the toast box.
  /// - [padding]: An optional `EdgeInsets` that defines the padding inside the
  ///   toast.
  /// - [leftSpacing]: An optional `double` that defines the spacing on the left
  ///   side of the toast.
  /// - [leadingData]: An optional `AnimatedToastLeadingData` that defines the
  ///   leading data for the toast.
  const AnimatedToastStyle({
    this.leadingData,
    this.boxDecoration,
    this.padding,
    this.leftSpacing,
  });
}

class AnimatedToastLeadingData {
  final Widget? widget;
  final bool? withoutIcon;

  /// A class that holds data for the leading part of an animated toast.
  ///
  /// This class contains a widget that can be used as the leading icon or
  /// content of the toast, and a boolean flag to indicate whether the icon
  /// should be omitted.
  ///
  /// - [widget]: is the widget to be displayed as the leading
  /// content of the toast. It can be any widget, such as an icon or an image.
  ///
  /// - [withoutIcon] : is a boolean flag that indicates whether the
  /// leading icon should be omitted. If set to `true`, the leading icon will
  /// not be displayed. The default value is `false`.
  ///
  const AnimatedToastLeadingData({this.widget, this.withoutIcon = false});
}
