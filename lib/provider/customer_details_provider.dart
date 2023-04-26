
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/customer_details_repo.dart';
import 'package:flutter/material.dart';

class CustomerDetailsProvider with ChangeNotifier{

  final DioClient dioClient;
  final CustomerDetailsRepo customerDetailsRepo;

  CustomerDetailsProvider({required this.dioClient, required this.customerDetailsRepo});
}