import 'package:flutter/material.dart';

class DefaultIconWidget extends StatelessWidget {
  const DefaultIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: const Icon(Icons.check, color: Colors.white, size: 16),
    );
  }
}
