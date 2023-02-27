import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/banner.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSuccesState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  HomeRequestSuccesState(this.bannerList);
}
