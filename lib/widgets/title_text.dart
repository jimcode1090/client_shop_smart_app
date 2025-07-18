import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;

  const TitleTextWidget({
    super.key,
    required this.label,
    this.fontSize = 20,
    this.color,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
    ;
  }
}
