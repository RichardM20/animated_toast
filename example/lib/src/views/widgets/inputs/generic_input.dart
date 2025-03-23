import 'package:flutter/material.dart';

class GenericInput extends _GenericInputBase {
  const GenericInput._({
    required super.label,
    required super.keyboardType,
    required super.obscureText,
    required super.controller,
  });

  factory GenericInput.password({
    required String label,
    required TextEditingController controller,
  }) {
    return GenericInput._(
      controller: controller,
      label: label,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  factory GenericInput.email({
    required String label,
    required TextEditingController controller,
  }) {
    return GenericInput._(
      controller: controller,
      label: label,
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
    );
  }

  factory GenericInput.general({
    required String label,
    required TextEditingController controller,
  }) {
    return GenericInput._(
      controller: controller,
      label: label,
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }
}

class _GenericInputBase extends StatefulWidget {
  const _GenericInputBase({
    required this.label,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
  });

  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  @override
  _GenericInputBaseState createState() => _GenericInputBaseState();
}

class _GenericInputBaseState extends State<_GenericInputBase> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void didUpdateWidget(covariant _GenericInputBase oldWidget) {
    if (oldWidget.obscureText != widget.obscureText) {
      setState(() {
        _obscureText = widget.obscureText;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget? get suffixIcon {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: _toggleObscureText,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: suffixIcon,
      ),
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      controller: widget.controller,
    );
  }
}
