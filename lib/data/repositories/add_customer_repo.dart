import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class AddCustomerRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AddCustomerRepo({required this.dioClient, required this.sharedPreferences});

  /// Add new customer
  Future<ApiResponse> addNewCustomerData({required String customerName, required String customerEmail, required String customerMobile,
    required String customerAddress, required dynamic districtId, required dynamic thanaId, required dynamic areaId}) async{
    try{
      Response response = await dioClient.post(
          AppConstants.addCustomerUrl,
          queryParameters: {
            'customer_name': customerName,
            'customer_email' : customerEmail,
            'customer_mobile' : customerMobile,
            'customer_address' : customerAddress,
            'district_id' : districtId,
            'thana_id' : thanaId,
            'area_id' : areaId,
          },
      //     options: Options(headers: {
      //       "Content-Type": "application/json",
      //       "Authorization":
      //       "Bearer ${ sharedPreferences.getString(AppConstants.token) ?? ""}",
      // }),

      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}