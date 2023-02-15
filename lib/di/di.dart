import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_shop/data/datasource/authentication_datasource.dart';
import 'package:mobile_shop/data/repository/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

//datasource
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
//repository
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}
