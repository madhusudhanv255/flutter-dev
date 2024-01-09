// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class AppButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final onPressed;
  IconData? icon;
  double size;

  AppButtons(
      {required this.textColor,
      required this.backgroundColor,
      required this.onPressed,
      required this.borderColor,
      required this.text,
      this.icon,
      required this.size,
      onTap,
      super.key});

  @override
  Widget build(context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
    // );
  }
}
