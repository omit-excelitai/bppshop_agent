import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'dashboard': 'Dashboard',
      'customer': 'Customer',
      'my_commission': 'My Commission',
      'order_history': 'Order History',
      'wallet': 'Wallet',
      'logout': 'Log out',
      'theme': 'Change Theme',
      'switchButton': 'Language',
    },
    'bn': {
      'dashboard': 'ড্যাশবোর্ড',
      'customer': 'কাস্টমার',
      'my_commission': 'আমার কমিশন',
      'order_history': 'অর্ডার হিস্ট্রি',
      'wallet': 'ওয়ালেট',
      'logout': 'লগ আউট',
      'theme': 'চেঞ্জ থিম',
      'switchButton': 'ভাষা',
    },
  };

  String? get dashboard {
    return _localizedValues[locale.languageCode]!['dashboard'];
  }

  String? get customer {
    return _localizedValues[locale.languageCode]!['customer'];
  }

  String? get switchButton {
    return _localizedValues[locale.languageCode]!['switchButton'];
  }

  String? get my_commission {
    return _localizedValues[locale.languageCode]!['my_commission'];
  }

  String? get order_history {
    return _localizedValues[locale.languageCode]!['order_history'];
  }

  String? get wallet {
    return _localizedValues[locale.languageCode]!['wallet'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get theme {
    return _localizedValues[locale.languageCode]!['theme'];
  }



  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'bn'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    return false;
  }
}
