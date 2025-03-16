import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon; 
  final double iconSize;
  AppIcon(
      {super.key,
      this.size = 40,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756D54),
      required this.icon, this.iconSize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
