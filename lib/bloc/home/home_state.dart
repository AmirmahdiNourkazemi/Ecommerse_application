import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/banner.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/data/model/product.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSuccesState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  Either<String, List<Category>> categoryList;
  Either<String, List<Products>> productList;
  Either<String, List<Products>> hotestProductList;
  Either<String, List<Products>> bestSellerProductList;
  HomeRequestSuccesState(this.bannerList, this.categoryList, this.productList,
      this.hotestProductList, this.bestSellerProductList);
}
