
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String label;
  final String value;
  const Items({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: Colors.white54, fontSize: 13)),
      ],
    );
  }
}
