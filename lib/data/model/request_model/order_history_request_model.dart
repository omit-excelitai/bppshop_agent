

import 'dart:convert';

OrderHistoryRequestModel orderHistoryRequestModelFromJson(String str) => OrderHistoryRequestModel.fromJson(json.decode(str));

String orderHistoryRequestModelToJson(OrderHistoryRequestModel data) => json.encode(data.toJson());

class OrderHistoryRequestModel {
  OrderHistoryRequestModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory OrderHistoryRequestModel.fromJson(Map<String, dynamic> json) => OrderHistoryRequestModel(
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
    this.data,
  });

  final int? total;
  final String? page;
  final int? noOfRows;
  final List<Datum>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.orderDate,
    this.orderId,
    this.customerId,
    this.totalProducts,
    this.totalAmount,
  });

  final String? orderDate;
  final int? orderId;
  final int? customerId;
  final int? totalProducts;
  final int? totalAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderDate: json["order_date"],
    orderId: json["order_id"],
    customerId: json["customer_id"],
    totalProducts: json["total_products"],
    totalAmount: json["total_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_date": orderDate,
    "order_id": orderId,
    "customer_id": customerId,
    "total_products": totalProducts,
    "total_amount": totalAmount,
  };
}
