import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/widgets/appbar_back.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';

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
            leading: AppbarBack(),
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
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {},
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(avgPadding),
                                hintText: S.of(context).existingEnter,
                                hintStyle: smallText(),
                                filled: true, // Don't forget this!
                                fillColor: notSelectedColor,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: lightBlue,
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:lightBlue, width: 0),
                                  
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
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
