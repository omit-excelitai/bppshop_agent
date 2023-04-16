import 'dart:convert';

AgentDashboardModel agentDashboardModelFromJson(String str) => AgentDashboardModel.fromJson(json.decode(str));

String agentDashboardModelToJson(AgentDashboardModel data) => json.encode(data.toJson());

class AgentDashboardModel {
  AgentDashboardModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory AgentDashboardModel.fromJson(Map<String, dynamic> json) => AgentDashboardModel(
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
    this.totalCustomers,
    this.totalOrders,
    this.totalSaleAmount,
    this.totalCommission,
    this.totalWithdraw,
    this.totalPurchase,
  });

  final int? totalCustomers;
  final int? totalOrders;
  final String? totalSaleAmount;
  final String? totalCommission;
  final String? totalWithdraw;
  final String? totalPurchase;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalCustomers: json["total_customers"],
    totalOrders: json["total_orders"],
    totalSaleAmount: json["total_sale_amount"],
    totalCommission: json["total_commission"],
    totalWithdraw: json["total_withdraw"],
    totalPurchase: json["total_purchase"],
  );

  Map<String, dynamic> toJson() => {
    "total_customers": totalCustomers,
    "total_orders": totalOrders,
    "total_sale_amount": totalSaleAmount,
    "total_commission": totalCommission,
    "total_withdraw": totalWithdraw,
    "total_purchase": totalPurchase,
  };
}
