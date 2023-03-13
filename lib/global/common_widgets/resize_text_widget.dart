import 'package:flutter/material.dart';

class ResizeTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double width;

  const ResizeTextWidget({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        clipBehavior: Clip.none,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
