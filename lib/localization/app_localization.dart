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
      'logout': 'Log Out',
      'theme': 'Change Theme',
      'home': 'Home',
      'agent_profile': 'Agent Profile',
      'update_agent_profile': 'Update Agent Profile',
      'profile': 'Profile',
      'add_customer': 'Add Customer',
      'add_new_customer': 'Add New Customer',
      'bpp_shop': 'BPPSHOP',
      'agent_panel': 'Agent Panel',
      'customer_list': 'Customer List',
      'pending_commission': 'Pending Commission',
      'commission_history': 'Commission History',
      'switchButton': 'Language',
      'total_customer': 'Total Customer',
      'total_withdraw': 'Total Withdraw',
      'total_sale_amount': 'Total Sale Amount',
      'total_orders': 'Total Orders',
      'total_commission': 'Total Commission',
      'total_purchase': 'Total Purchase',
      'no_internet': 'No internet!',
      'check_internet': 'Please check your internet connection',
      'try_again': 'Try Again',
      'balance': 'Balance',
      'role': 'Role',
      'contact_info': 'CONTACT INFORMATION',
      'mobile': 'Mobile',
      'email': 'Email',
      'address': 'Address',
      'add': 'Add',
      'update': 'Update',
      'available_balance': 'Available Balance',
      'no_data': 'No Data Found!',
      'customer_profile': 'Customer Profile',
      'customer_name': 'Customer Name',
      'customer_id': 'Customer ID',
      'update_customer': 'Update Customer',
      'order_details': 'Order Details',
      'no_thanks': 'No Thanks',
      'log_out_text': 'Are you sure you want to log out of your account?',
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
      'update_agent_profile': 'আপডেট এজেন্ট প্রোফাইল',
      'profile': 'প্রোফাইল',
      'add_customer': 'অ্যাড কাস্টমার',
      'add_new_customer': 'অ্যাড নিউ কাস্টমার',
      'bpp_shop': 'বিপ্পশপ',
      'agent_panel': 'এজেন্ট প্যানেল',
      'customer_list': 'কাস্টমার লিস্ট',
      'pending_commission': 'পেন্ডিং কমিশন',
      'commission_history': 'কমিশন হিস্ট্রি',
      'switchButton': 'ভাষা',
      'total_customer': 'টোটাল কাস্টমার',
      'total_withdraw': 'টোটাল উইথড্র',
      'total_sale_amount': 'টোটাল সেল এমাউন্ট',
      'total_orders': 'টোটাল অর্ডারস',
      'total_commission': 'টোটাল কমিশন',
      'total_purchase': 'টোটাল ক্রয়',
      'no_internet': 'ইন্টারনেট নেই!',
      'check_internet': 'আপনার ইন্টারনেট সংযোগ চেক করুন',
      'try_again': 'আবার চেষ্টা করুন',
      'balance': 'ব্যালেন্স',
      'role': 'ভূমিকা',
      'contact_info': 'যোগাযোগের তথ্য',
      'mobile': 'মোবাইল',
      'email': 'ইমেইল',
      'address': 'ঠিকানা',
      'add': 'অ্যাড',
      'update': 'আপডেট',
      'available_balance': 'পর্যাপ্ত টাকা',
      'no_data': 'কোন তথ্য পাওয়া যায়নি!',
      'customer_profile': 'কাস্টমার প্রোফাইল',
      'customer_name': 'কাস্টমার নাম',
      'customer_id': 'কাস্টমার আইডি',
      'update_customer': 'আপডেট কাস্টমার',
      'order_details': 'অর্ডার ডিটেলস',
      'no_thanks': 'নো থাঙ্কস',
      'log_out_text': 'আপনি কি নিশ্চিত যে আপনি আপনার অ্যাকাউন্ট থেকে লগ আউট করতে চান?',
    },
  };


  String? get dashboard {
    return _localizedValues[locale.languageCode]!['dashboard'];
  }String? get no_thanks {
    return _localizedValues[locale.languageCode]!['no_thanks'];
  }String? get log_out_text {
    return _localizedValues[locale.languageCode]!['log_out_text'];
  }String? get order_details {
    return _localizedValues[locale.languageCode]!['order_details'];
  }String? get update_customer {
    return _localizedValues[locale.languageCode]!['update_customer'];
  }String? get customer_profile {
    return _localizedValues[locale.languageCode]!['customer_profile'];
  }String? get customer_name {
    return _localizedValues[locale.languageCode]!['customer_name'];
  }String? get customer_id {
    return _localizedValues[locale.languageCode]!['customer_id'];
  }String? get update_agent_profile {
    return _localizedValues[locale.languageCode]!['update_agent_profile'];
  }String? get available_balance {
    return _localizedValues[locale.languageCode]!['available_balance'];
  }String? get no_data {
    return _localizedValues[locale.languageCode]!['no_data'];
  }String? get add {
    return _localizedValues[locale.languageCode]!['add'];
  }String? get update {
    return _localizedValues[locale.languageCode]!['update'];
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
  String? get total_customer {
    return _localizedValues[locale.languageCode]!['total_customer'];
  }
  String? get total_withdraw {
    return _localizedValues[locale.languageCode]!['total_withdraw'];
  }
  String? get total_sale_amount {
    return _localizedValues[locale.languageCode]!['total_sale_amount'];
  }
  String? get total_orders {
    return _localizedValues[locale.languageCode]!['total_orders'];
  }
  String? get total_commission {
    return _localizedValues[locale.languageCode]!['total_commission'];
  }
  String? get total_purchase {
    return _localizedValues[locale.languageCode]!['total_purchase'];
  }
  String? get no_internet {
    return _localizedValues[locale.languageCode]!['no_internet'];
  }
  String? get check_internet {
    return _localizedValues[locale.languageCode]!['check_internet'];
  }
  String? get try_again {
    return _localizedValues[locale.languageCode]!['try_again'];
  }String? get balance {
    return _localizedValues[locale.languageCode]!['balance'];
  }String? get role {
    return _localizedValues[locale.languageCode]!['role'];
  }String? get contact_info {
    return _localizedValues[locale.languageCode]!['contact_info'];
  }String? get mobile {
    return _localizedValues[locale.languageCode]!['mobile'];
  }String? get email {
    return _localizedValues[locale.languageCode]!['email'];
  }String? get address {
    return _localizedValues[locale.languageCode]!['address'];
  }String? get add_new_customer {
    return _localizedValues[locale.languageCode]!['add_new_customer'];
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
