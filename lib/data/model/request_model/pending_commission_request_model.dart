

import 'dart:convert';

PendingCommissionRequestModel pendingCommissionRequestModelFromJson(String str) => PendingCommissionRequestModel.fromJson(json.decode(str));

String pendingCommissionRequestModelToJson(PendingCommissionRequestModel data) => json.encode(data.toJson());

class PendingCommissionRequestModel {
  PendingCommissionRequestModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory PendingCommissionRequestModel.fromJson(Map<String, dynamic> json) => PendingCommissionRequestModel(
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
    this.pendingCommissionList,
  });

  final int? total;
  final String? page;
  final int? noOfRows;
  final List<PendingCommissionData>? pendingCommissionList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    pendingCommissionList: json["data"] == null ? [] : List<PendingCommissionData>.from(json["data"]!.map((x) => PendingCommissionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": pendingCommissionList == null ? [] : List<dynamic>.from(pendingCommissionList!.map((x) => x.toJson())),
  };
}

class PendingCommissionData {
  PendingCommissionData({
    this.customerId,
    this.orderId,
    this.totalProducts,
    this.totalAmount,
    this.totalCommission,
    this.deliveryStatus,
    this.orderDate,
  });

  final int? customerId;
  final int? orderId;
  final int? totalProducts;
  final int? totalAmount;
  final double? totalCommission;
  final String? deliveryStatus;
  final String? orderDate;

  factory PendingCommissionData.fromJson(Map<String, dynamic> json) => PendingCommissionData(
    customerId: json["customer_id"],
    orderId: json["order_id"],
    totalProducts: json["total_products"],
    totalAmount: json["total_amount"],
    totalCommission: json["total_commission"]?.toDouble(),
    deliveryStatus: json["delivery_status"],
    orderDate: json["order_date"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "order_id": orderId,
    "total_products": totalProducts,
    "total_amount": totalAmount,
    "total_commission": totalCommission,
    "delivery_status": deliveryStatus,
    "order_date": orderDate,
  };
}
