import 'package:flutter/material.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/widgets/appbar_back.dart';

class StartNewFamilyPage extends StatefulWidget {
  const StartNewFamilyPage({super.key});

  @override
  State<StartNewFamilyPage> createState() => _StartNewFamilyPageState();
}

class _StartNewFamilyPageState extends State<StartNewFamilyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBackgroundColor,
            leading: AppbarBack(),
            title: Text("Create Your Family" , style: appbarText(),),
            centerTitle: true,
          ),
        );
      },
    );
  }
}
