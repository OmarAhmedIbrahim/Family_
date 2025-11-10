import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/pages/choose_family_page.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';
import 'package:quran_app/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetYourNamePage extends StatefulWidget {
  const SetYourNamePage({super.key});

  @override
  State<SetYourNamePage> createState() => _SetYourNamePageState();
}

class _SetYourNamePageState extends State<SetYourNamePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkSavedName();
  }

  @override
  void dispose() {
  _firstNameController.dispose();
  _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _checkSavedName() async {
    // Check SharedPreferences for a saved user name; if present, skip this page.
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('user_name');
    if (savedName != null && savedName.isNotEmpty && mounted) {
      // Replace this page with the next page in flow.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ChooseFamilyPage()),
      );
      return;
    }

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Scaffold(
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
                      border: Border.all(width: 3, color: selectedColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        midHeightSpace(),
                        CustomIcon(
                          color: languageIconColor,
                          icon: Iconsax.profile_circle,
                          iconColor: Colors.white,
                          length: 70,
                          size: 35,
                        ),
                        smallHeightSpace(),
                        Text(
                          S.of(context).setYourName_welcome,
                          style: titleDescription(weight: FontWeight.bold),
                        ),

                        Text(
                          S.of(context).setYourName_getToKnow,
                          style: smallText(
                            weight: FontWeight.w500,
                            color: lightBlue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        midHeightSpace(),
                        SizedBox(
                          width: screenWidth * .8,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _firstNameController,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).nextFocus();
                                },
                                hintText: S.of(context).setYourName_firstNameHint,
                                borderWidth: 1,
                              ),
                              smallHeightSpace(),
                              CustomTextField(
                                controller: _lastNameController,
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) {},
                                hintText: S.of(context).setYourName_lastNameHint,
                                borderWidth: 1,
                              ),
                            ],
                          ),
                        ),
                        midHeightSpace(),
                        CustomButton(
                          onTap: () async {
                            final first = _firstNameController.text.trim();
                            final last = _lastNameController.text.trim();
                            if (first.isEmpty || last.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(S.of(context).setYourName_emptyNameError)),
                              );
                              return;
                            }

                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('user_name', '$first $last');

                            if (!mounted) return;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChooseFamilyPage(),
                              ),
                            );
                          },
                          buttonColor: buttonColor,
                          text: S.of(context).setYourName_continue,
                          width: screenWidth * 0.8,
                          //textColor: Colors.black,
                        ),
                        midHeightSpace(),
                      ],
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
