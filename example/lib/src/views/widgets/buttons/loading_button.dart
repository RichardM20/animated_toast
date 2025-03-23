import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.buttonText,
    required this.isLoading,
    required this.onPressed,
  });

  final String buttonText;
  final bool isLoading;
  final Function() onPressed;

  @override
  State<LoadingButton> createState() => _GenericButtonState();
}

class _GenericButtonState extends State<LoadingButton>
    with TickerProviderStateMixin {
  late AnimationController loadingAnimation;
  late AnimationController textAnimation;

  late Animation<double> _animation;
  late Animation<double> _textAnimation;

  bool _showText = true;
  bool _runningSecondAnimation = false;

  final _generalDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    loadingAnimation = AnimationController(
      vsync: this,
      duration: _generalDuration,
    );

    textAnimation = AnimationController(
      vsync: this,
      duration: _generalDuration,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(loadingAnimation);
    _textAnimation = Tween<double>(begin: 1, end: 0).animate(textAnimation);

    super.initState();
  }

  @override
  void didUpdateWidget(LoadingButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        textAnimation.forward().whenComplete(() {
          setState(() {
            _runningSecondAnimation = true;
            _showText = false;
          });
          loadingAnimation.forward();
        });
      } else {
        loadingAnimation.reverse().whenComplete(() {
          setState(() {
            _runningSecondAnimation = false;
            _showText = true;
          });
          textAnimation.reverse();
        });
      }
    }
  }

  List<Color> get _colors {
    if (widget.isLoading) {
      return [Colors.grey, Colors.grey];
    } else {
      return [Colors.purple, Colors.deepPurpleAccent];
    }
  }

  BorderRadius get _radius {
    if (widget.isLoading) {
      return BorderRadius.circular(24);
    }
    return BorderRadius.circular(8);
  }

  double get _spacing {
    if (_showText) {
      return 8;
    }
    return 0;
  }

  double get _width {
    if (widget.isLoading) {
      return 48;
    }
    return MediaQuery.of(context).size.width;
  }

  Widget buildScaleAnimation({
    required Widget child,
    required Animation<double> scale,
  }) {
    return ScaleTransition(
      scale: scale,
      alignment: Alignment.center,
      child: child,
    );
  }

  Widget get _text {
    if (_showText) {
      return Flexible(
        child: buildScaleAnimation(
          scale: _textAnimation,
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget get _loading {
    if (_showText) return SizedBox.shrink();
    return buildScaleAnimation(
      scale: _animation,
      child: CircularProgressIndicator(
        constraints: BoxConstraints(minHeight: 24, minWidth: 24),
        strokeWidth: 1.5,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _generalDuration,
      height: 48,
      width: _width,
      decoration: BoxDecoration(
        borderRadius: _radius,
        gradient: LinearGradient(
          colors: _colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: _radius,
          onTap: widget.isLoading ? null : widget.onPressed,
          child: Row(
            spacing: _spacing,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_text, _loading],
          ),
        ),
      ),
    );
  }
}
