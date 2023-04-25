import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/datasource/remote/exception/api_error_handler.dart';
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DistrictThanaAreaRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  DistrictThanaAreaRepo({required this.dioClient, required this.sharedPreferences});

  /// For get all district data
  Future<ApiResponse> getAllDistrictData() async{
    try{
      Response response = await dioClient.get(AppConstants.districtUrl);
      return ApiResponse.withSuccess(response);
    }catch(e){
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /// For get all thana data
  Future<ApiResponse> getAllThanaData({required int? districtId}) async{
    try{
      Response response = await dioClient.get("${AppConstants.thanaUrl}$districtId");
      return ApiResponse.withSuccess(response);
    }catch(e){
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /// For get all area data
  Future<ApiResponse> getAllAreaData({required int? thanaId}) async{
    try{
      Response response = await dioClient.get("${AppConstants.areaUrl}$thanaId");
      return ApiResponse.withSuccess(response);
    }catch(e){
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}