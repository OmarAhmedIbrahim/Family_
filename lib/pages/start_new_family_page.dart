import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/pages/family_page.dart';
import 'package:quran_app/widgets/appbar_back.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';
import 'package:quran_app/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartNewFamilyPage extends StatefulWidget {
  const StartNewFamilyPage({super.key});

  @override
  State<StartNewFamilyPage> createState() => _StartNewFamilyPageState();
}

class _StartNewFamilyPageState extends State<StartNewFamilyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBackgroundColor,
            automaticallyImplyLeading: false,
            title: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  AppbarBack(),
                  Expanded(
                    child: Center(
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: Text(
                          S.of(context).startNewFamily_appBarTitle,
                          style: appbarText(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Card(
                  elevation: 20,
                  child: Container(
                    width: screenWidth * 0.9,
                    //height: 300,
                    decoration: BoxDecoration(
                      color: cardColor,
                      border: Border.all(width: 3, color: lightBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(avgPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          midHeightSpace(),
                          Center(
                            child: CustomIcon(
                              //color: dividerColor,
                              icon: Iconsax.user_cirlce_add,
                              length: 70,
                              size: 35,
                            ),
                          ),
                          smallHeightSpace(),
                          Center(
                            child: Text(
                              S.of(context).startNewFamily_familySetup,
                              style: titleDescription(weight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              S.of(context).startNewFamily_description,
                              style: smallText(
                                weight: FontWeight.w500,
                                color: lightBlue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          midHeightSpace(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: smallPadding,
                            ),
                            child: Text(S.of(context).startNewFamily_familyNameLabel, style: smallText()),
                          ),

                          SizedBox(
                            width: screenWidth * .8,
                            child: CustomTextField(
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {},
                              hintText: S.of(context).startNewFamily_enterFamilyNameHint,
                            ),
                          ),
                          midHeightSpace(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: smallPadding,
                            ),
                            child: Text(
                              S.of(context).startNewFamily_completeQuranReadingLabel,
                              style: smallText(),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * .8,
                            child: CustomTextField(
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {},
                              hintText: S.of(context).startNewFamily_readingTimesExample,
                            ),
                          ),
                          smallHeightSpace(),
                          Text(
                            S.of(context).startNewFamily_goalChangeNote,
                            style: smallText(
                              color: Colors.grey,
                              weight: FontWeight.w300,
                            ),
                          ),
                          midHeightSpace(),
                          CustomButton(
                            width: screenWidth * 0.8,
                            text: S.of(context).startNewFamily_createButton,
                            onTap: () async {
                              final navigator = Navigator.of(context);
                              final prefs = await SharedPreferences.getInstance();
                              // mark that family setup is completed so next app start can open FamilyPage directly
                              await prefs.setBool('familySetupCompleted', true);
                              if (!mounted) return;
                              navigator.pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const FamilyPage();
                                  },
                                ),
                              );
                            },
                            buttonColor: buttonColor,
                          ),
                          midHeightSpace(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
