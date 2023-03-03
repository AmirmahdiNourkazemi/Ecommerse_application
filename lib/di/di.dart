import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_shop/data/datasource/authentication_datasource.dart';
import 'package:mobile_shop/data/datasource/banner_datasource.dart';
import 'package:mobile_shop/data/datasource/category_datasource.dart';
import 'package:mobile_shop/data/datasource/product_datasource.dart';
import 'package:mobile_shop/data/repository/authentication_repository.dart';
import 'package:mobile_shop/data/repository/category_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/banner_repository.dart';
import '../data/repository/product_repository.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

//datasource
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());
  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());
  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());
//repository

  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
}
