import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/datasource/banner_datasource.dart';
import 'package:mobile_shop/data/model/banner.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampain>>> getBanner();
}

class BannerRepository extends IBannerRepository {
  @override
  final IBannerDatasource _datasource = locator.get();
  Future<Either<String, List<BannerCampain>>> getBanner() async {
    try {
      var response = await _datasource.getBanner();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
