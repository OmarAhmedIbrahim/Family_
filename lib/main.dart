import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/software/providers/language_provider.dart';
import 'package:quran_app/pages/choose_language_page.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //this make sure language is loaded before building the app and restores the locale on app restart
        ChangeNotifierProvider(create: (context) => LanguageProvider()..loadLocale()),
      ],
      child: Builder(
        builder: (context)  {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: appBackgroundColor, 

            ),
            locale: Locale(context.watch<LanguageProvider>().appLanguage),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: ChooseLanguagePage(),
          );
        }
      ),
    );
  }
}
