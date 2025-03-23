import 'package:flutter/widgets.dart';

class MessageData {
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String title;
  final String? subtitle;

  /// A class that holds the data for a message, including its title, subtitle,
  /// and their respective text styles.
  ///
  /// The [MessageData] class is used to encapsulate the information needed to
  /// display a message with a title and an optional subtitle, along with their
  /// text styles.
  /// - [title]: The main text of the message. This is a required field.
  /// - [titleStyle]: The text style for the title. This is an optional field.
  /// - [subtitle]: The secondary text of the message. This is an optional field.
  /// - [subtitleStyle]: The text style for the subtitle. This is an optional field.
  MessageData({
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
  });
}
