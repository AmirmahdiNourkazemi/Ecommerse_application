import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/product.dart';
import '../../di/di.dart';
import '../../util/api_exeption.dart';
import '../datasource/product_datasource.dart';

abstract class IProductRepository {
  Future<Either<String, List<Products>>> getProducts();
  Future<Either<String, List<Products>>> getHotest();
  Future<Either<String, List<Products>>> getBestSell();
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Products>>> getProducts() async {
    try {
      var response = await _datasource.getProducts();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Products>>> getBestSell() async {
    try {
      var response = await _datasource.getBestSeller();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Products>>> getHotest() async {
    try {
      var response = await _datasource.getHotest();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
