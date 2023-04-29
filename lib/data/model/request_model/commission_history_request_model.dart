

import 'dart:convert';

CommissionHistoryRequestModel commissionHistoryRequestModelFromJson(String str) => CommissionHistoryRequestModel.fromJson(json.decode(str));

String commissionHistoryRequestModelToJson(CommissionHistoryRequestModel data) => json.encode(data.toJson());

class CommissionHistoryRequestModel {
  final String? status;
  final String? message;
  final Data? data;

  CommissionHistoryRequestModel({
    this.status,
    this.message,
    this.data,
  });

  factory CommissionHistoryRequestModel.fromJson(Map<String, dynamic> json) => CommissionHistoryRequestModel(
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
  final int? total;
  final dynamic page;
  final int? noOfRows;
  final List<CommissionHistoryListData>? commissionHistoryList;

  Data({
    this.total,
    this.page,
    this.noOfRows,
    this.commissionHistoryList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    commissionHistoryList: json["data"] == null ? [] : List<CommissionHistoryListData>.from(json["data"]!.map((x) => CommissionHistoryListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": commissionHistoryList == null ? [] : List<dynamic>.from(commissionHistoryList!.map((x) => x.toJson())),
  };
}

class CommissionHistoryListData {
  final int? customerId;
  final int? orderId;
  final int? totalProducts;
  final int? totalAmount;
  final double? totalCommission;
  final String? deliveryStatus;
  final String? orderDate;

  CommissionHistoryListData({
    this.customerId,
    this.orderId,
    this.totalProducts,
    this.totalAmount,
    this.totalCommission,
    this.deliveryStatus,
    this.orderDate,
  });

  factory CommissionHistoryListData.fromJson(Map<String, dynamic> json) => CommissionHistoryListData(
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
