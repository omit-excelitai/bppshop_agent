

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
    this.orderHistoryList,
  });

  final int? total;
  final dynamic page;
  final int? noOfRows;
  final List<OrderHistoryData>? orderHistoryList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    orderHistoryList: json["data"] == null ? [] : List<OrderHistoryData>.from(json["data"]!.map((x) => OrderHistoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": orderHistoryList == null ? [] : List<dynamic>.from(orderHistoryList!.map((x) => x.toJson())),
  };
}

class OrderHistoryData {
  OrderHistoryData({
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

  factory OrderHistoryData.fromJson(Map<String, dynamic> json) => OrderHistoryData(
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
