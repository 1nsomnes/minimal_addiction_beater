import 'package:flutter/material.dart';

class GestureText extends StatelessWidget {
  const GestureText({
    super.key,
    required this.onTap,
    required this.textColor,
    required this.fontSize,
    required this.text,
  });

  final Function() onTap;
  final Color? textColor;
  final double fontSize;
  final String text;

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
