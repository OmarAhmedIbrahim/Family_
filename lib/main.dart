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
        ChangeNotifierProvider(create: (context) => LanguageProvider()..loadLocale()),
      ],
      child: Builder(
        builder: (context)  {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: appBackgroundColor, // Your desired color

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
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:quran_app/generated/l10n.dart';
// import 'package:quran_app/pages/choose_language_page.dart';
// import 'package:quran_app/software/providers/language_provider.dart';

// void main() {
//   runApp(const QuranApp());
// }

// class QuranApp extends StatelessWidget {
//   const QuranApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => LanguageProvider()..loadLocale()),
//       ],
//       child: const _QuranAppBody(),
//     );
//   }
// }

// // A tiny wrapper that waits for the language to be loaded before building the MaterialApp. 

// class _QuranAppBody extends StatelessWidget {
//   const _QuranAppBody();

//   @override
//   Widget build(BuildContext context) {
//     // since the appLanguage will be null while the provider is still loading.
//     final language = context.select<LanguageProvider, String?>(
//         (p) => p.appLanguage);

//     // Show a simple loading screen until the locale is ready.
//     if (language == null) {
//       return const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         ),
//       );
//     }

//     return MaterialApp(
//       locale: Locale(language),
//       localizationsDelegates: const [
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       debugShowCheckedModeBanner: false,
//            home: ChooseLanguagePage(),
      
//       );}}