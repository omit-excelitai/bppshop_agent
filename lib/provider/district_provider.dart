import 'package:bppshop/http_data/district_http.dart';
import 'package:bppshop/model/districts_response_model.dart';
import 'package:flutter/material.dart';

class DistrictProvider with ChangeNotifier{

  List<DistrictData> districtData = [];

  List<DistrictData> get getDistrict => districtData;

  getDistrictData() async {
    districtData = await DistrictHttpRequest.fetchDistrictData();
    notifyListeners();
  }

}