import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;

  const CustomButton({super.key, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: color,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Custom Button",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
