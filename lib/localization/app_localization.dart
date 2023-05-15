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
      'home': 'Home',
      'agent_profile': 'Agent Profile',
      'profile': 'Profile',
      'add_customer': 'Add Customer',
      'bpp_shop': 'BPPSHOP',
      'agent_panel': 'Agent Panel',
      'customer_list': 'Customer List',
      'pending_commission': 'Pending Commission',
      'commission_history': 'Commission History',
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
      'home': 'হোম',
      'agent_profile': 'এজেন্ট প্রোফাইল',
      'profile': 'প্রোফাইল',
      'add_customer': 'অ্যাড কাস্টমার',
      'bpp_shop': 'বিপ্পশপ',
      'agent_panel': 'এজেন্ট প্যানেল',
      'customer_list': 'কাস্টমার লিস্ট',
      'pending_commission': 'পেন্ডিং কমিশন',
      'commission_history': 'কমিশন হিস্ট্রি',
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

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }

  String? get agent_profile {
    return _localizedValues[locale.languageCode]!['agent_profile'];
  }

  String? get add_customer {
    return _localizedValues[locale.languageCode]!['add_customer'];
  }

  String? get bpp_shop {
    return _localizedValues[locale.languageCode]!['bpp_shop'];
  }

  String? get agent_panel {
    return _localizedValues[locale.languageCode]!['agent_panel'];
  }

  String? get customer_list {
    return _localizedValues[locale.languageCode]!['customer_list'];
  }

  String? get pending_commission {
    return _localizedValues[locale.languageCode]!['pending_commission'];
  }

  String? get commission_history {
    return _localizedValues[locale.languageCode]!['commission_history'];
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
