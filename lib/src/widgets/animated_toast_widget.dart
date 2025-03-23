import 'package:animated_toast/src/animated_toast_service.dart';
import 'package:animated_toast/src/controllers/animated_toast_controller.dart';
import 'package:animated_toast/src/models/toast_decoration_styles.dart';
import 'package:animated_toast/src/models/toast_duration.dart';
import 'package:animated_toast/src/models/toast_sizes.dart';
import 'package:animated_toast/src/models/toast_text_data.dart';
import 'package:animated_toast/src/widgets/animated_toast_build.dart';
import 'package:flutter/material.dart';

class ToastWidget extends StatefulWidget {
  const ToastWidget({
    super.key,
    required this.overlayEntry,
    required this.messageData,
    required this.position,
    required this.duration,
    required this.animationAlignment,
    this.size,
    this.style,
    this.onDismiss,
  });

  final OverlayEntry overlayEntry;
  final MessageData messageData;
  final AnimatedToastSize? size;
  final AnimatedToastStyle? style;
  final AnimatedToastDuration duration;
  final AnimatedToastStartOf animationAlignment;
  final AnimatedToastPosition position;
  final void Function()? onDismiss;

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with TickerProviderStateMixin {
  late final ToastAnimationController _animationController;

  bool _isExpanded = false;

  @override
  void initState() {
    _animationController = ToastAnimationController(
      vsync: this,
      onEntryComplete: _onEntryAnimationComplete,
      duration: widget.duration.begin,
      animationAlignment: widget.animationAlignment,
    );

    _animationController.startEntryAnimation(_setupAutoDismiss);

    super.initState();
  }

  void _setupAutoDismiss() {
    final displayDuration = widget.duration.displayDuration;
    if (displayDuration != null) {
      Future.delayed(displayDuration, () {
        if (mounted) {
          _closeToast();
        }
      });
    }
  }

  void _onEntryAnimationComplete() {
    if (mounted) {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  void _closeToast() {
    setState(() {
      _isExpanded = true;
    });

    _animationController.startExitAnimation(() {
      widget.overlayEntry.remove();
      widget.onDismiss?.call();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Alignment get alignment {
    return widget.position.top != true
        ? Alignment.bottomCenter
        : Alignment.topCenter;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: alignment,
            child: SlideTransition(
              position: _animationController.toastAnimation,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: _closeToast,
                  child: AnimatedToastBodyBuild(
                    margin: widget.position.spacing,
                    messageData: widget.messageData,
                    isExpanded: _isExpanded,
                    size: widget.size,
                    style: widget.style,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
