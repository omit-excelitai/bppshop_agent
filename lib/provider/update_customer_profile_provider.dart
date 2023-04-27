
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/update_customer_profile_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/base_model/error_response.dart';
import '../utill/app_color_resources.dart';

class UpdateCustomerProfileProvider with ChangeNotifier{

  final DioClient dioClient;
  final UpdateCustomerProfileRepo updateCustomerProfileRepo;
  bool _isLoading = false;

  UpdateCustomerProfileProvider({required this.dioClient, required this.updateCustomerProfileRepo});

  bool get isLoading => _isLoading;

  /// Update customer profile
  Future<String?> updateCustomerProfile({required dynamic customer_name, required dynamic customer_address, required dynamic customer_id, required BuildContext context}) async{

    _isLoading = true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await updateCustomerProfileRepo.updateCustomerProfileData(
        customer_name: customer_name,
        customer_address: customer_address,
        customer_id: customer_id);

    // if(kDebugMode){
    //   print("addNewAddress statusCode >>>>>>>>>>>>>>>> ${apiResponse.response!.statusCode.toString()}");
    // }

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      _isLoading = false;
      EasyLoading.dismiss();
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiResponse.response!.data["message"]),
        backgroundColor: AppColorResources.primaryMaterial,
      ));
      notifyListeners();
      return apiResponse.response!.data["status"];
    }
    else {
      EasyLoading.dismiss();
      notifyListeners();
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.error![0].message);
        errorMessage = errorResponse.error![0].message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
      notifyListeners();
      return apiResponse.response!.data["status"];
    }

  }

}