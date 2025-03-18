import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(this.text,
      {super.key,
      this.isBold = false,
      this.fontSize = 17,
      this.color = const Color.fromARGB(255, 42, 42, 42),
      this.textAlign = TextAlign.left});
  final String text;
  final double fontSize;
  final bool isBold;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
