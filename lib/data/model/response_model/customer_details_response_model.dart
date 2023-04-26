
import 'dart:convert';

CustomerDetailsResponseModel customerDetailsResponseModelFromJson(String str) => CustomerDetailsResponseModel.fromJson(json.decode(str));

String customerDetailsResponseModelToJson(CustomerDetailsResponseModel data) => json.encode(data.toJson());

class CustomerDetailsResponseModel {
  CustomerDetailsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory CustomerDetailsResponseModel.fromJson(Map<String, dynamic> json) => CustomerDetailsResponseModel(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
