import 'package:flutter/material.dart';

class ButtonTextRow extends StatelessWidget {
  const ButtonTextRow({Key? key, required this.text, required this.icons}) : super(key: key);
  final String text;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text),
        Icon(icons),
      ],
    );
  }
}
