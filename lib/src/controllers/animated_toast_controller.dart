import 'package:animated_toast/src/animated_toast_service.dart';
import 'package:flutter/material.dart';

class ToastAnimationController {
  final TickerProvider vsync;
  final VoidCallback onEntryComplete;

  late final AnimationController _toastAnimationController;
  late final Animation<Offset> toastAnimation;
  final AnimatedToastStartOf animationAlignment;
  final Duration duration;

  ToastAnimationController({
    required this.vsync,
    required this.onEntryComplete,
    this.animationAlignment = AnimatedToastStartOf.top,
    this.duration = const Duration(milliseconds: 300),
  }) {
    _initializeControllers();
    _initializeAnimations();
    _setupListeners();
  }

  void _initializeControllers() {
    _toastAnimationController = AnimationController(
      vsync: vsync,
      duration: duration,
    );
  }

  void _initializeAnimations() {
    Offset begin;
    switch (animationAlignment) {
      case AnimatedToastStartOf.top:
        begin = Offset(0, -5);
        break;
      case AnimatedToastStartOf.bottom:
        begin = Offset(0, 5);
        break;
      case AnimatedToastStartOf.left:
        begin = Offset(-5, 0);
        break;
      case AnimatedToastStartOf.right:
        begin = Offset(5, 0);
        break;
    }

    toastAnimation = Tween<Offset>(begin: begin, end: Offset.zero).animate(
      CurvedAnimation(parent: _toastAnimationController, curve: Curves.easeOut),
    );
  }

  void _setupListeners() {
    _toastAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 100), () {
          onEntryComplete();
        });
      }
    });
  }

  void startEntryAnimation(VoidCallback onEntryComplete) {
    _toastAnimationController.forward().whenComplete(onEntryComplete);
  }

  void startExitAnimation(VoidCallback onExitComplete) {
    _toastAnimationController.reverse().whenComplete(onExitComplete);
  }

  void dispose() {
    _toastAnimationController.dispose();
  }
}
