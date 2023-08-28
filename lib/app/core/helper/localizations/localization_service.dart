import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  static const Locale fallbackLocale = Locale('vi', 'VN');

  static const List<Locale> supportedLocales = <Locale>[
    Locale('vi', 'VN'),
    Locale('en', 'US'),
  ];

  static final Locale locale = _getLocaleFromLanguage(langCode: 'vi');

  static void changeLocale(String langCode) {
    final Locale locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  static Locale _getLocaleFromLanguage({String? langCode}) {
    /// get locale with devices
    final String? languageCodeCurrent =
        langCode ?? Get.deviceLocale?.languageCode;
    final Locale? localeSelected = supportedLocales.firstWhereOrNull(
      (Locale locale) => locale.languageCode == languageCodeCurrent,
    );
    return localeSelected ?? Get.locale ?? fallbackLocale;
  }

  @override
  Map<String, Map<String, String>> get keys => {};
}
