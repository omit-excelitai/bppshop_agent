

import 'package:bppshop_agent/data/repositories/auth_repo.dart';
import 'package:bppshop_agent/provider/agent_profile_provider.dart';
import 'package:bppshop_agent/provider/auth_provider.dart';
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';


final sl = GetIt.instance;

Future<void> init() async {

  /// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
     sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  ///Repository

     sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));


  /// Provider

  sl.registerFactory(() => AuthProvider(authRepo: sl(),dioClient: sl()));


  /// External
   final sharedPreferences = await SharedPreferences.getInstance();
   sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => Dio());
   sl.registerLazySingleton(() => LoggingInterceptor());
   //sl.registerLazySingleton(() => Connectivity());

}