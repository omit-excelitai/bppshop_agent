

import 'package:bppshop_agent/data/repositories/add_customer_repo.dart';
import 'package:bppshop_agent/data/repositories/agent_dashboard_repo.dart';
import 'package:bppshop_agent/data/repositories/agent_profile_repo.dart';
import 'package:bppshop_agent/data/repositories/auth_repo.dart';
import 'package:bppshop_agent/data/repositories/customer_details_repo.dart';
import 'package:bppshop_agent/data/repositories/customer_list_repo.dart';
import 'package:bppshop_agent/data/repositories/district_thana_area_repo.dart';
import 'package:bppshop_agent/data/repositories/pending_commission_repo.dart';
import 'package:bppshop_agent/data/repositories/update_customer_profile_repo.dart';
import 'package:bppshop_agent/provider/add_customer_provider.dart';
import 'package:bppshop_agent/provider/agent_dashboard_provider.dart';
import 'package:bppshop_agent/provider/agent_profile_provider.dart';
import 'package:bppshop_agent/provider/auth_provider.dart';
import 'package:bppshop_agent/provider/customer_details_provider.dart';
import 'package:bppshop_agent/provider/customer_list_provider.dart';
import 'package:bppshop_agent/provider/district_thana_area_provider.dart';
import 'package:bppshop_agent/provider/order_history_provider.dart';
import 'package:bppshop_agent/provider/pending_commission_provider.dart';
import 'package:bppshop_agent/provider/update_customer_profile_provider.dart';
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/order_history_repo.dart';


final sl = GetIt.instance;

Future<void> init() async {

  /// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
     sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
     sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => AgentProfileRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => AgentDashboardRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => DistrictThanaAreaRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => AddCustomerRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => PendingCommissionRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => CustomerListRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => OrderHistoryRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => CustomerDetailsRepo(dioClient: sl(), sharedPreferences: sl()));
     sl.registerLazySingleton(() => UpdateCustomerProfileRepo(dioClient: sl(), sharedPreferences: sl()));

  /// Provider
     sl.registerFactory(() => AuthProvider(authRepo: sl(),dioClient: sl()));
     sl.registerFactory(() => AgentProfileProvider(agentProfileRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => AgentDashboardProvider(agentDashboardRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => DistrictThanaAreaProvider(districtThanaAreaRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => AddCustomerProvider(addCustomerRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => PendingCommissionProvider(pendingCommissionRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => CustomerListProvider(customerListRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => OrderHistoryProvider(orderHistoryRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => CustomerDetailsProvider(customerDetailsRepo: sl(), dioClient: sl()));
     sl.registerFactory(() => UpdateCustomerProfileProvider(updateCustomerProfileRepo: sl(), dioClient: sl()));


  /// External
      final sharedPreferences = await SharedPreferences.getInstance();
      sl.registerLazySingleton(() => sharedPreferences);
      sl.registerLazySingleton(() => Dio());
      sl.registerLazySingleton(() => LoggingInterceptor());

}