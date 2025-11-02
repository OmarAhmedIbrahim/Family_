import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/widgets/appbar_back.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';
import 'package:quran_app/widgets/custom_text_field.dart';

class JoinExistingFamilyPage extends StatefulWidget {
  const JoinExistingFamilyPage({super.key});

  @override
  State<JoinExistingFamilyPage> createState() => _JoinExistingFamilyPageState();
}

class _JoinExistingFamilyPageState extends State<JoinExistingFamilyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBackgroundColor,
            automaticallyImplyLeading: false,
            // fix children order to physical left using an LTR Row while keeping the title's
            // internal text direction localized so Arabic title text still renders RTL.
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
                          S.of(context).existingJoin,
                          style: titleLarge(),
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
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  largeHeightSpace(),
                  CustomIcon(
                    color: dividerColor,
                    icon: Iconsax.profile_2user,
                    iconColor: Colors.black,
                    length: 70,
                    size: 35,
                  ),
                  midHeightSpace(),
                  Text(
                    S.of(context).existingJoin,
                    style: titleLarge(),
                    textAlign: TextAlign.center,
                  ),
                  smallHeightSpace(),
                  Text(
                    S.of(context).existingCode,
                    style: titleDescription(),
                    textAlign: TextAlign.center,
                  ),
                  largeHeightSpace(),
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
                          midHeightSpace(),
                          CustomIcon(
                            color: dividerColor,
                            icon: Iconsax.key,
                            iconColor: Colors.black,
                            length: 70,
                            size: 35,
                          ),
                          smallHeightSpace(),
                          Text(
                            S.of(context).existingFamilyCode,
                            style: titleDescription(weight: FontWeight.bold),
                          ),

                          Text(
                            S.of(context).existingAsk,
                            style: smallText(
                              weight: FontWeight.w500,
                              color: lightBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          midHeightSpace(),
                          SizedBox(
                            width: screenWidth * .8,
                            child: CustomTextField(
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {},
                              hintText: S.of(context).existingEnter,
                              borderWidth: 0,
                            ),
                          ),
                          smallHeightSpace(),
                          CustomButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      JoinExistingFamilyPage(),
                                ),
                              );
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
