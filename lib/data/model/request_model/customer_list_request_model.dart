
import 'dart:convert';

CustomerListRequestModel customerListRequestModelFromJson(String str) => CustomerListRequestModel.fromJson(json.decode(str));

String customerListRequestModelToJson(CustomerListRequestModel data) => json.encode(data.toJson());

class CustomerListRequestModel {
  CustomerListRequestModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory CustomerListRequestModel.fromJson(Map<String, dynamic> json) => CustomerListRequestModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.total,
    this.page,
    this.noOfRows,
    this.customerList,
  });

  final int? total;
  final dynamic page;
  final int? noOfRows;
  final List<CustomerListData>? customerList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    customerList: json["data"] == null ? [] : List<CustomerListData>.from(json["data"]!.map((x) => CustomerListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": customerList == null ? [] : List<dynamic>.from(customerList!.map((x) => x.toJson())),
  };
}

class CustomerListData {
  CustomerListData({
    this.id,
    this.customerName,
    this.customerEmail,
    this.customerMobile,
    this.customerAddress,
  });

  final int? id;
  final String? customerName;
  final String? customerEmail;
  final String? customerMobile;
  final String? customerAddress;

  factory CustomerListData.fromJson(Map<String, dynamic> json) => CustomerListData(
    id: json["id"],
    customerName: json["customer_name"],
    customerEmail: json["customer_email"],
    customerMobile: json["customer_mobile"],
    customerAddress: json["customer_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_name": customerName,
    "customer_email": customerEmail,
    "customer_mobile": customerMobile,
    "customer_address": customerAddress,
  };
}
