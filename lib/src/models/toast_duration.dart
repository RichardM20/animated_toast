class AnimatedToastDuration {
  final Duration? displayDuration;
  final Duration begin;

  /// Represents the duration of the toast animation.
  ///
  /// This class defines the duration for which the toast animation will be displayed.
  /// - [begin]: The duration for which the toast animation will start.
  /// - [displayDuration]: The duration for which the toast animation will be displayed.
  const AnimatedToastDuration({required this.begin, this.displayDuration});
}
