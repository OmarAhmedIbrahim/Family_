import 'package:flutter/material.dart';
import 'package:quran_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final String text;
  final Color? textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Border? border;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.text,
    this.textColor,
    this.width = 300,
    this.height = 50,
    this.borderRadius = 20,
    this.border,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border ?? Border.all(width: 1.0 , color: borderNotSelectedColor ),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ?? TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}