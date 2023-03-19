
import 'package:app_open/src/data/api/api_service.dart';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/data/repository/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

GetIt getIt = GetIt.instance;

///ServiceLocator for dependency injection
class ServiceLocator {
  /// register all singletons ///
  Future<void> setup() async {
    debugPrint("service locator setup...");
    //dio client
    getIt.registerSingleton(Dio());
    getIt.registerSingleton(DioClient(getIt<Dio>()));
    getIt.registerSingleton(ApiService(dioClient: getIt<DioClient>()));

    // Repos
    getIt.registerSingleton(HomeRepo(getIt.get<ApiService>()));

    //More screen
    //getIt.registerSingleton(MoreNewContactRepo(getIt.get<ApiService>()));

  }
}
