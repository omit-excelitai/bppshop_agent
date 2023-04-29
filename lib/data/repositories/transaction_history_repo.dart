import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionHistoryRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  TransactionHistoryRepo({ required this.dioClient, required this.sharedPreferences});

  /// Transaction History Data
}