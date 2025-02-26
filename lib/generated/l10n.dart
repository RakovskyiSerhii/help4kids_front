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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Help4Kids app`
  String get title {
    return Intl.message(
      'Help4Kids app',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Профессійний медичний нагляд – турботливо та з любов’ю\n\nКонсультації педіатра\n\nПрофілактичні огляди здорових дітей до 3 років\nКонсультації з грудного вигодовування\nЛікування за міжнародними рекомендаціями\nЛікування дітей і дорослих з внутрішньовенним введенням препаратів\n\nЖіноча консультація (м. Мерефа) – ніжно і дбайливо\n\nОформлення всіх необхідних довідок і листків непрацездатності\n\nМедичні огляди в школу та дитячий садок – комплексно, швидко, без черг\n\nВакцинація дітей та дорослих – ефективно та безпечно, якісними європейськими вакцинами\n\nАналізи – вчасно та якісно, експрес тести – миттєвий результат\n\nДбаємо про Ваше здоров’я, зберігаємо Ваш спокій, цінуємо Ваш час і забезпечуємо максимальний сервіс і комфорт!`
  String get home_description {
    return Intl.message(
      'Профессійний медичний нагляд – турботливо та з любов’ю\n\nКонсультації педіатра\n\nПрофілактичні огляди здорових дітей до 3 років\nКонсультації з грудного вигодовування\nЛікування за міжнародними рекомендаціями\nЛікування дітей і дорослих з внутрішньовенним введенням препаратів\n\nЖіноча консультація (м. Мерефа) – ніжно і дбайливо\n\nОформлення всіх необхідних довідок і листків непрацездатності\n\nМедичні огляди в школу та дитячий садок – комплексно, швидко, без черг\n\nВакцинація дітей та дорослих – ефективно та безпечно, якісними європейськими вакцинами\n\nАналізи – вчасно та якісно, експрес тести – миттєвий результат\n\nДбаємо про Ваше здоров’я, зберігаємо Ваш спокій, цінуємо Ваш час і забезпечуємо максимальний сервіс і комфорт!',
      name: 'home_description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'uk', countryCode: 'UA'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
