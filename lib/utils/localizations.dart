import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Translate the selected key into the currently selected locale using pluralization
String $n(String key, num count, {Map<String, dynamic>? args}) {
  String value = Localization.instance.plural(key, count);

  if (args != null) {
    for (final key in args.keys) {
      value = value.replaceAll('{$key}', '${args[key]}');
    }
  }

  return value;
}

/// Handles saving and loading of the selected locale from persistent storage
class TranslatePreferences implements ITranslatePreferences {
  static const _selectedLocaleKey = 'appLocale';

  @override
  Future<Locale?> getPreferredLocale() async {
    final box = await SharedPreferences.getInstance();

    if (!box.containsKey(_selectedLocaleKey)) {
      return null;
    }

    return localeFromString(box.getString(_selectedLocaleKey)!);
  }

  @override
  Future<bool> savePreferredLocale(Locale locale) async {
    try {
      final box = await SharedPreferences.getInstance();

      await box.setString(_selectedLocaleKey, localeToString(locale));

      return true;
    } catch (_) {
      return false;
    }
  }
}
