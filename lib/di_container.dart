

import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';


final sl = GetIt.instance;

Future<void> init() async {


// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
     sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

//Repository

//   sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));


//   sl.registerLazySingleton(() => ShopRepo(dioClient: sl(), sharedPreferences: sl()));


  /// Provider

   // sl.registerFactory(() => ProductPageProvider(sharedPreferences: sl()));
   // sl.registerFactory(() => ProductSearchProvider(productSearchRepo: sl()));



  //// External
   final sharedPreferences = await SharedPreferences.getInstance();
   sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => Dio());
   sl.registerLazySingleton(() => LoggingInterceptor());
//   sl.registerLazySingleton(() => Connectivity());

}