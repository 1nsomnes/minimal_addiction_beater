import 'package:flutter/material.dart';

class GestureText extends StatelessWidget {
  GestureText({
    super.key,
    required this.onTap,
    this.textColor,
    required this.fontSize,
    required this.text,
  });

  Function() onTap;
  Color? textColor;
  double fontSize;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: fontSize,
          decoration: TextDecoration.underline,
          decorationColor:
              textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
