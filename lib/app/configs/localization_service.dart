import 'dart:ui';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:get/get.dart';

class LocalizationService {
  static Language get currentLocale {
    final data = box.read(Config.keys.localLanguage);
    if (data != null) {
      return langs.firstWhere((el) => el.languageCode == data['lc']);
    }
    return Language(LocaleKeys.english_lang.tr, 'en');
  }

  // Default locale
  static Locale get locale {
    final loc = box.read(Config.keys.localLanguage);
    if (loc != null) {
      return Locale(loc['lc'], loc['cc']);
    }
    return Locale("en", "US");
  }

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static List<Language> get langs => [
        Language(LocaleKeys.frensh_lang.tr, 'fr'),
        Language(LocaleKeys.english_lang.tr, 'en'),
      ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('fr', 'FR'),
    const Locale('en', 'US'),
  ];

  // Gets locale from language, and updates the locale
  void changeLocale(Locale lang) {
    box.write(Config.keys.localLanguage, {
      'lc': lang.languageCode,
      'cc': lang.countryCode,
    });
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String? lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}

class Language {
  String name;
  String languageCode;
  Language(this.name, this.languageCode);
}
