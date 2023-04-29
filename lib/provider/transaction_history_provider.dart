
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/transaction_history_repo.dart';
import 'package:flutter/material.dart';

class TransactionHistoryProvider with ChangeNotifier{

  final DioClient dioClient;
  final TransactionHistoryRepo transactionHistoryRepo;
  bool _isLoading = false;

  TransactionHistoryProvider({required this.dioClient, required this.transactionHistoryRepo});

  bool get isLoading => _isLoading;

}