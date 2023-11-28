import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.name,
      this.onPressed,
      required this.color, required this.style});
  final String name;
  final Function()? onPressed;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size.fromHeight(55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: Text(name, style: style),
      ),
    );
  }
}
