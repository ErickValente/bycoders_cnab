import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final String title;
  final TextEditingController controller;
  final bool obscure;

  const CustomTextField(
      {Key? key,
      required this.width,
      required this.title,
      required this.controller,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.3,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(offset: Offset(-0.2, 0.2), color: Colors.grey)
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 40, left: 20),
          hintText: title,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
