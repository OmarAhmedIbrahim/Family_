import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';

class UserAssignedPages extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onButtonTap;
  final double width;
  final IconData icon;

  const UserAssignedPages({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onButtonTap,
    required this.width,
    this.icon = Iconsax.book_saved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: borderNotSelectedColor),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(avgPadding),
            child: CustomIcon(icon: icon, length: 40),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: smallText()),
                Text(subtitle, style: smallText(weight: FontWeight.w300)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: avgPadding),
            child: CustomButton(
              onTap: onButtonTap ?? () {},
              buttonColor: buttonColor,
              text: buttonText,
              textStyle: smallText(),
              width: 120,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}