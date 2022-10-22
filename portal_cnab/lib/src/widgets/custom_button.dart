import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key,
      required this.width,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width * 0.3,
        height: 55,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(title),
        ));
  }
}
