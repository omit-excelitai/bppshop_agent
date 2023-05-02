import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class CustomerListRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CustomerListRepo({required this.dioClient, required this.sharedPreferences});

  /// Fetch Customer List Data
  Future<ApiResponse> fetchCustomerListData({required dynamic pageNo, required dynamic no_of_rows}) async{
    try{
      Response response = await dioClient.post(
        AppConstants.customerListUrl,
        data: {
          'page': pageNo,
          'no_of_rows' : no_of_rows,
        },
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}