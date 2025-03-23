import 'package:animated_toast/src/exports.dart';
import 'package:animated_toast/src/utils/box_decoration_utill.dart';
import 'package:animated_toast/src/widgets/default_leading_icon.dart';
import 'package:flutter/material.dart';

final _lastAnimationDuration = Duration(milliseconds: 300);

class AnimatedToastBodyBuild extends StatelessWidget {
  const AnimatedToastBodyBuild({
    super.key,
    required this.messageData,
    required this.isExpanded,
    required this.margin,
    this.size,
    this.style,
  });

  final MessageData messageData;
  final bool isExpanded;
  final AnimatedToastSize? size;
  final double margin;
  final AnimatedToastStyle? style;

  final _defaulLastSize = 44.0;
  final _defaultFirstSize = 84.0;

  double get _height {
    if (size != null) {
      return size!.height;
    }

    return messageData.subtitle != null ? _defaultFirstSize : _defaulLastSize;
  }

  double _width(context) {
    if (size != null) {
      return isExpanded ? size!.maxWidth : size!.minWidth;
    }

    final containSubtitle = messageData.subtitle != null;
    double width = containSubtitle ? _defaultFirstSize : _defaulLastSize;

    return isExpanded ? MediaQuery.of(context).size.width * 0.8 : width;
  }

  BoxDecoration get _boxDecoration => ToastBoxDecorationBuilder.build(
    isExpanded: isExpanded,
    style: style?.boxDecoration,
  );

  Widget get _buildIcon {
    final customIcon = style?.leadingData?.widget;
    final withoutIcon = style?.leadingData?.withoutIcon ?? false;

    if (withoutIcon) {
      return const SizedBox.shrink();
    }
    if (customIcon != null) {
      return customIcon;
    }

    return const DefaultIconWidget();
  }

  Widget get _buildSubtitlle {
    if (messageData.subtitle != null) {
      return Text(
        messageData.subtitle!,
        style: messageData.subtitleStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildTextContent() {
    return AnimatedOpacity(
      opacity: isExpanded ? 1 : 0,
      duration: _lastAnimationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 2,
        children: [
          Text(
            messageData.title,
            style: messageData.titleStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          _buildSubtitlle,
        ],
      ),
    );
  }

  EdgeInsets get _padding {
    if (style?.padding != null) {
      return style!.padding!;
    }
    return const EdgeInsets.all(8);
  }

  Alignment get _leadingAlignment {
    return isExpanded ? Alignment.centerLeft : Alignment.center;
  }

  double get spacing {
    if (style?.leftSpacing != null) {
      return style!.leftSpacing!;
    }

    return style?.leadingData?.withoutIcon == true ? 0 : 34;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _lastAnimationDuration,
      height: _height,
      width: _width(context),
      padding: _padding,
      margin: EdgeInsets.symmetric(vertical: margin),
      decoration: _boxDecoration,
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: _leadingAlignment,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            child: _buildIcon,
          ),
          Positioned(
            left: spacing,
            right: 8,
            top: 0,
            bottom: 0,
            child: ClipRect(child: _buildTextContent()),
          ),
        ],
      ),
    );
  }
}
