import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ebike_flutter/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Platform.localeName.isNotEmpty
      ? Locale(Platform.localeName)
      : const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}
