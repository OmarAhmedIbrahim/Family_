import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider  extends ChangeNotifier {
  String appLanguage = 'en';

   Future<String> loadLocale() async {
   final prefs = await SharedPreferences.getInstance();
   appLanguage = prefs.getString('language') ?? 'en';
   notifyListeners();
   return appLanguage;
   
 }

  void changeLang(String lang){
    appLanguage = lang;
    notifyListeners();
  }
}