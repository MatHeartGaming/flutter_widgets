import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = "AnimatedScreen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeAppearence() {
    final random = Random();

    width = random.nextDouble() * 350;
    height = random.nextDouble() * 600;
    borderRadius = random.nextDouble() * 50;

    final red = random.nextInt(255);
    final green = random.nextInt(255);
    final blue = random.nextInt(255);
    final alpha = random.nextDouble();

    color = Color.fromRGBO(red, green, blue, alpha);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeAppearence(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
