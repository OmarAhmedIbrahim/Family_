import 'package:flutter/material.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/pages/choose_family_page.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool? isDisplayedOnce = false;

  @override
  void initState() {
    // TODO: implement initState
    displayed();
    super.initState();
  }

  Future<void> displayed() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDisplayedOnce = prefs.getBool("welcomeDisplayed");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isDisplayedOnce == false || isDisplayedOnce == null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(largePadding),
                  child: Column(
                    children: [
                      midHeightSpace(),
                      Container(
                        width: constraints.maxWidth * 0.95,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage("assets/images/mosque2.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      smallHeightSpace(),
                      Text(
                        S.of(context).appGoal,
                        style: titleDescription(weight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      smallHeightSpace(),
                      Text(
                        S.of(context).appDescription,
                        style: smallText(weight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      largeHeightSpace(),

                      Card(
                        elevation: 20,
                        child: Container(
                          width: screenWidth * .9,
                          //height: 300,
                          decoration: BoxDecoration(
                            color: cardColor,
                            border: Border.all(color: borderNotSelectedColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(avgPadding),
                                child: CustomIcon(icon: Icons.favorite , length: 50,),
                              ),
                              smallHeightSpace(),
                              Text(
                                S.of(context).start,
                                style: titleLarge(),
                                textAlign: TextAlign.center,
                              ),
                              smallHeightSpace(),

                              Text(
                                S.of(context).join,
                                style: titleDescription(),
                                textAlign: TextAlign.center,
                              ),
                              midHeightSpace(),
                              CustomButton(
                                onTap: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool("welcomeDisplayed", true);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChooseFamilyPage(),
                                    ),
                                  );
                                },
                                buttonColor: buttonColor,
                                text: S.of(context).begin,
                                textColor: Colors.white,
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
            ),
          );
        },
      );
    } else {
      return ChooseFamilyPage();
    }
  }
}
