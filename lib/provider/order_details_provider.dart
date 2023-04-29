import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/order_details_repo.dart';
import 'package:flutter/material.dart';
import '../data/model/response_model/order_details_response_model.dart';

class OrderDetailsProvider with ChangeNotifier{

  final DioClient dioClient;
  final OrderDetailsRepo orderDetailsRepo;
  bool _isLoading = false;
  OrderDetailsResponseModel? _orderDetailsResponseModel;
  List<Product>? _productsList;
  Product? _product;

  OrderDetailsProvider({required this.dioClient, required this.orderDetailsRepo});

  bool get isLoading => _isLoading;
  OrderDetailsResponseModel? get orderDetailsResponseModel => _orderDetailsResponseModel;
  List<Product>? get productsList => _productsList;
  Product? get product => _product;
}