import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/di/di.dart';
import 'package:mobile_shop/util/api_exeption.dart';

import '../datasource/category_datasource.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getCategories();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
