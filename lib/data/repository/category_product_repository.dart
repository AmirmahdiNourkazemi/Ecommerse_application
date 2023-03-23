import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/product.dart';
import 'package:mobile_shop/util/api_exeption.dart';

import '../../di/di.dart';
import '../datasource/category_product_datasource.dart';

abstract class ICategoryProductRepository {
  Future<Either<String, List<Products>>> getProductByCategoryId(
      String categoryId);
}

class CategoryProductRepository extends ICategoryProductRepository {
  final ICategoryDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<Products>>> getProductByCategoryId(
      String categoryId) async {
    try {
      var response = await _datasource.getProductByCategory(categoryId);
      return right(response);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}