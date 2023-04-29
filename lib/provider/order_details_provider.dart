import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/order_details_repo.dart';
import 'package:flutter/material.dart';

class OrderDetailsProvider with ChangeNotifier{

  final DioClient dioClient;
  final OrderDetailsRepo orderDetailsRepo;

  OrderDetailsProvider({required this.dioClient, required this.orderDetailsRepo});
}