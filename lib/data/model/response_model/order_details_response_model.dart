
import 'dart:convert';

OrderDetailsResponseModel orderDetailsResponseModelFromJson(String str) => OrderDetailsResponseModel.fromJson(json.decode(str));

String orderDetailsResponseModelToJson(OrderDetailsResponseModel data) => json.encode(data.toJson());

class OrderDetailsResponseModel {
  final String? status;
  final String? message;
  final Data? data;

  OrderDetailsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) => OrderDetailsResponseModel(
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
  final String? orderId;
  final String? paymentStatus;
  final String? orderStatus;
  final String? paymentMethod;
  final int? orderAmount;
  final String? orderDate;
  final int? discountAmount;
  final String? customerName;
  final String? shippingAddress;
  final List<Product>? productsList;

  Data({
    this.orderId,
    this.paymentStatus,
    this.orderStatus,
    this.paymentMethod,
    this.orderAmount,
    this.orderDate,
    this.discountAmount,
    this.customerName,
    this.shippingAddress,
    this.productsList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["order_id"],
    paymentStatus: json["payment_status"],
    orderStatus: json["order_status"],
    paymentMethod: json["payment_method"],
    orderAmount: json["order_amount"],
    orderDate: json["order_date"],
    discountAmount: json["discount_amount"],
    customerName: json["customer_name"],
    shippingAddress: json["shipping_address"],
    productsList: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "payment_status": paymentStatus,
    "order_status": orderStatus,
    "payment_method": paymentMethod,
    "order_amount": orderAmount,
    "order_date": orderDate,
    "discount_amount": discountAmount,
    "customer_name": customerName,
    "shipping_address": shippingAddress,
    "products": productsList == null ? [] : List<dynamic>.from(productsList!.map((x) => x.toJson())),
  };
}

class Product {
  final String? productName;
  final int? price;
  final int? discount;
  final int? quantity;

  Product({
    this.productName,
    this.price,
    this.discount,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productName: json["product_name"],
    price: json["price"],
    discount: json["discount"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "price": price,
    "discount": discount,
    "quantity": quantity,
  };
}
