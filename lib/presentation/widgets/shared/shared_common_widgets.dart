import 'package:flutter/material.dart';

class SeparatorBetweenWidgets extends StatelessWidget {
  final String text;

  const SeparatorBetweenWidgets({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Text(text),
      ],
    );
  }
}
