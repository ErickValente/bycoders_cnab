import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final Color backColor;
  final VoidCallback onTap;

  const MenuIcon(
      {Key? key,
      required this.icon,
      required this.backColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Icon(icon, size: 36, color: Colors.white),
      ),
    );
  }
}
