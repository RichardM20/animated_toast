class AnimatedToastPosition {
  final bool top;
  final double spacing;

  /// Creates an `AnimatedToastPosition` with the given [top] and [spacing].
  ///
  /// - [top] parameter determines if the toast is positioned at the top,
  /// - [spacing] parameter specifies the distance from the top or bottom.
  const AnimatedToastPosition({required this.top, this.spacing = 30});
}

class AnimatedToastSize {
  final double height;

  final double minWidth;
  final double maxWidth;

  /// Creates an `AnimatedToastSize` with the given [height], [minWidth], and [maxWidth].
  ///
  /// - [height]  specifies the height of the toast, which must be greater than 0.
  /// - [minWidth]  specifies the minimum width of the toast, which must be greater than 0.
  /// - [maxWidth]  specifies the maximum width of the toast, which must be greater than [minWidth].
  const AnimatedToastSize({
    required this.height,
    required this.minWidth,
    required this.maxWidth,
  }) : assert(height > 0, 'Height must be greater than 0'),
       assert(minWidth > 0, 'MinWidth must be greater than 0'),
       assert(maxWidth > minWidth, 'MaxWidth must be greater than MinWidth');
}
