import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/pages/welcome_page.dart';
import 'package:quran_app/software/providers/language_provider.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({super.key});

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  bool _isLoading = true;
  String? _storedLanguage;
  bool arIsSelected = false;
  bool enIsSelected = false;

  @override
  void initState() {
    super.initState();
    _checkStoredLanguage();
  }

  Future<void> _checkStoredLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedLanguage = prefs.getString('language');
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // If we have a stored language, then go to WelcomePage
    if (_storedLanguage != null &&
        (_storedLanguage == 'ar' || _storedLanguage == 'en')) {
      return WelcomePage();
    }

    // Otherwise, show the language selection UI
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context,constraints){
            double screenWidth = constraints.maxWidth;
            return Column(
              children: [
                midHeightSpace(),
                Padding(
                  padding: const EdgeInsets.only(top: largePadding),
                  child: Text("Family Quran" , style: appName(),),
                ),
                Divider(color: dividerColor, thickness: 5,radius: BorderRadius.circular(5), endIndent: screenWidth *.2 , indent: screenWidth*.2,),
                largeHeightSpace(),Center(
                  child: Card(
                    elevation: 20,
                    child: Container(
                      width: screenWidth *.9,
                      //height: 300,
                      decoration: BoxDecoration(
                        color: cardColor,
                        border: Border.all(color: borderNotSelectedColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: largePadding,
                          horizontal: avgPadding,
                        ),
                        child: Column(
                          children: [
                            midHeightSpace(),
                            CircleAvatar(
                              backgroundColor: languageIconColor,
                              radius: 40,
                              child: Icon(
                                Icons.language,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            midHeightSpace(),
                
                            Text(
                              "Choose your Language",
                              style: titleLarge(),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "اختر لغتك المفضلة",
                              style: titleDescription(),
                              textAlign: TextAlign.center,
                            ),
                            midHeightSpace(),
                
                            GestureDetector(
                              onTap: () async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setString('language', 'en');
                                setState(() {
                                  enIsSelected = true;
                                  arIsSelected = false;
                                });
                                context.read<LanguageProvider>().changeLang('en');
                              },
                              child: Container(
                                width: screenWidth*.7,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: (enIsSelected)
                                      ? selectedColor
                                      : notSelectedColor, // Border color
                
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: (enIsSelected)
                                        ? borderSelectedColor
                                        : borderNotSelectedColor, // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Center(
                                  child: Text("English", style: smallText()),
                                ),
                              ),
                            ),
                            smallHeightSpace(),
                
                            GestureDetector(
                              onTap: () async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setString('language', 'ar');
                                setState(() {
                                  arIsSelected = true;
                                  enIsSelected = false;
                                });
                                context.read<LanguageProvider>().changeLang('ar');
                              },
                              child: Container(
                                width: screenWidth*.7,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: (arIsSelected)
                                      ? selectedColor
                                      : notSelectedColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: (arIsSelected)
                                        ? borderSelectedColor
                                        : borderNotSelectedColor, // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "العربية",
                                    style: smallText(
                
                                    ),
                                  ),
                                ),
                              ),
                            ),
                
                            midHeightSpace(),
                            CustomButton(
                              onTap: () async {
                                final prefs = await SharedPreferences.getInstance();
                                String? lang = prefs.getString('language');
                                print(lang);
                                if (lang != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => WelcomePage(),
                                    ),
                                  );
                                } else {
                                  // Show error that no language selected
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please select a language'),
                                    ),
                                  );
                                }
                              },
                              buttonColor: buttonColor,
                              text: "Continue",
                              width: screenWidth*.7,
                            ),
                            smallHeightSpace(),
                            Text("You can change it later", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );}
        ),
      ),
    );
  }
}
