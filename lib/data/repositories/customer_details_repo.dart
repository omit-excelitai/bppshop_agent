import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDetailsRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CustomerDetailsRepo({required this.dioClient, required this.sharedPreferences});
}