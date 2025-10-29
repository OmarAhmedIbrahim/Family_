// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get title {
    return Intl.message('Welcome', name: 'title', desc: '', args: []);
  }

  /// `Unite your family through the blessed words of Allah `
  String get appGoal {
    return Intl.message(
      'Unite your family through the blessed words of Allah ',
      name: 'appGoal',
      desc: '',
      args: [],
    );
  }

  /// `Track your family's Quran reading journey together, assign daily readings, and celebrate milestones as one united family`
  String get appDescription {
    return Intl.message(
      'Track your family\'s Quran reading journey together, assign daily readings, and celebrate milestones as one united family',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `Begin now`
  String get begin {
    return Intl.message('Begin now', name: 'begin', desc: '', args: []);
  }

  /// `Join thousands of families reading the Quran together`
  String get join {
    return Intl.message(
      'Join thousands of families reading the Quran together',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Family's Journey Today`
  String get start {
    return Intl.message(
      'Start Your Family\'s Journey Today',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Your Family`
  String get welcome {
    return Intl.message(
      'Welcome To Your Family',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `How do you want to start your journey?`
  String get journey {
    return Intl.message(
      'How do you want to start your journey?',
      name: 'journey',
      desc: '',
      args: [],
    );
  }

  /// `Create a new family`
  String get create {
    return Intl.message(
      'Create a new family',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Start a new family group and invite members`
  String get invite {
    return Intl.message(
      'Start a new family group and invite members',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `-  Become the family admin`
  String get admin {
    return Intl.message(
      '-  Become the family admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `-  Set reading goals for your family`
  String get goals {
    return Intl.message(
      '-  Set reading goals for your family',
      name: 'goals',
      desc: '',
      args: [],
    );
  }

  /// `-  Manage family members`
  String get manage {
    return Intl.message(
      '-  Manage family members',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `-  Track everyone's progress`
  String get track {
    return Intl.message(
      '-  Track everyone\'s progress',
      name: 'track',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
