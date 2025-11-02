import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppbarBack extends StatefulWidget {
  const AppbarBack({super.key});

  @override
  State<AppbarBack> createState() => _AppbarBackState();
}

class _AppbarBackState extends State<AppbarBack> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Iconsax.arrow_left_2, color: Colors.white),
      tooltip: 'Back',
      onPressed: () => Navigator.maybePop(context),
    );
  }
}