import 'package:flutter/material.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final int maxLines;
  final double borderWidth;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.borderWidth = 1.0,
    this.fillColor,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle ?? smallText(color: Colors.white),
      controller: controller,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(avgPadding),
        hintText: hintText,
        hintStyle: hintStyle ?? smallText(color: Colors.grey),
        filled: true,
        fillColor: fillColor ?? notSelectedColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightBlue,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightBlue,
            width: borderWidth,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
