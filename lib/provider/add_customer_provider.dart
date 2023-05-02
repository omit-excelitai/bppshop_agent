import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/add_customer_repo.dart';
import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/base_model/error_response.dart';
import '../utill/app_style.dart';

class AddCustomerProvider with ChangeNotifier{

  final DioClient dioClient;
  final AddCustomerRepo addCustomerRepo;

  AddCustomerProvider({required this.dioClient, required this.addCustomerRepo});

  /// Add new customer
  Future<String?> createNewCustomer({required String customerName, required String customerEmail, required String customerMobile,
    required String customerAddress, required dynamic districtId, required dynamic thanaId, required dynamic areaId, required BuildContext context}) async{

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("No internet connection!", style: myStyleMontserrat(15.sp, AppColorResources.primaryWhite, FontWeight.w500)),
    //   backgroundColor: AppColorResources.redColor,
    // ));
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await addCustomerRepo.addNewCustomerData(
        customerName: customerName,
        customerEmail: customerEmail,
        customerMobile: customerMobile,
        customerAddress: customerAddress,
        districtId: districtId,
        thanaId: thanaId,
        areaId: areaId
    );

    // if(kDebugMode){
    //   print("addNewAddress statusCode >>>>>>>>>>>>>>>> ${apiResponse.response!.statusCode.toString()}");
    // }

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

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