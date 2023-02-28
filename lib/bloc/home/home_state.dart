import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/banner.dart';
import 'package:mobile_shop/data/model/category.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSuccesState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  Either<String, List<Category>> categoryList;
  HomeRequestSuccesState(this.bannerList, this.categoryList);
}
