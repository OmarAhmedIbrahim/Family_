import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/pages/join_existing_family_page.dart';
import 'package:quran_app/pages/start_new_family_page.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';

class ChooseFamilyPage extends StatefulWidget {
  const ChooseFamilyPage({super.key});

  @override
  State<ChooseFamilyPage> createState() => _ChooseFamilyPageState();
}

class _ChooseFamilyPageState extends State<ChooseFamilyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  largeHeightSpace(),
                  CustomIcon(icon: Iconsax.home, length: 75, size: 45),
                  midHeightSpace(),
                  Text(
                    S.of(context).welcome,
                    style: titleLarge(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    S.of(context).journey,
                    style: titleDescription(),
                    textAlign: TextAlign.center,
                  ),
                  midHeightSpace(),
                  Card(
                    elevation: 20,
                    child: Container(
                      width: screenWidth * 0.9,
                      //height: 300,
                      decoration: BoxDecoration(
                        color: cardColor,
                        border: Border.all(width: 3, color: lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          smallHeightSpace(),
                          CustomIcon(
                            icon: Iconsax.user_cirlce_add,
                            length: 70,
                            size: 35,
                          ),
                          smallHeightSpace(),
                          Text(
                            S.of(context).create,
                            style: titleDescription(weight: FontWeight.bold),
                          ),

                          Text(
                            S.of(context).invite,
                            style: smallText(
                              weight: FontWeight.w500,
                              color: lightBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          midHeightSpace(),
                          Container(
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              color: notSelectedColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: largePadding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  smallHeightSpace(),
                                  Text(S.of(context).admin, style: smallText()),
                                  Text(S.of(context).goals, style: smallText()),
                                  Text(
                                    S.of(context).manage,
                                    style: smallText(),
                                  ),
                                  Text(S.of(context).track, style: smallText()),
                                  smallHeightSpace(),
                                ],
                              ),
                            ),
                          ),
                          smallHeightSpace(),
                          CustomButton(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> StartNewFamilyPage()));
                            },
                            buttonColor: buttonColor,
                            text: S.of(context).buttonCreate,
                            width: screenWidth * 0.8,
                          ),
                          midHeightSpace(),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: Container(
                      width: screenWidth * 0.9,
                      //height: 300,
                      decoration: BoxDecoration(
                        color: cardColor,
                        border: Border.all(width: 3, color: dividerColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          smallHeightSpace(),
                          CustomIcon(
                            color: dividerColor,
                            icon: Iconsax.profile_2user,
                            iconColor: Colors.black,
                            length: 70,
                            size: 35,
                          ),
                          smallHeightSpace(),
                          Text(
                            S.of(context).existing,
                            style: titleDescription(weight: FontWeight.bold),
                          ),

                          Text(
                            S.of(context).connect,
                            style: smallText(
                              weight: FontWeight.w500,
                              color: lightBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          midHeightSpace(),
                          Container(
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              color: notSelectedColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: largePadding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  smallHeightSpace(),
                                  Text(S.of(context).code, style: smallText()),
                                  Text(S.of(context).get, style: smallText()),
                                  Text(
                                    S.of(context).progrss,
                                    style: smallText(),
                                  ),
                                  Text(S.of(context).together, style: smallText()),
                                  smallHeightSpace(),
                                ],
                              ),
                            ),
                          ),
                          smallHeightSpace(),
                          CustomButton(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> JoinExistingFamilyPage()));
                            },
                            buttonColor: dividerColor,
                            text: S.of(context).buttonJoin,
                            width: screenWidth * 0.8,
                            textColor: Colors.black,
                          ),
                          midHeightSpace(),
                        ],
                      ),
                    ),
                  ),
                  midHeightSpace(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
