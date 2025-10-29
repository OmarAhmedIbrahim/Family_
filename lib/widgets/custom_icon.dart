import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  CustomIcon({super.key, required this.icon, required this.length, this.size , this.color , this.iconColor});
  final IconData icon;
  final double length;
  Color? color;
  double? size;
  Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        color: color ??Color(0xFF223c62),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: iconColor?? Colors.white, size: size),
    );
  }
}
//color: Color(0xff305486)