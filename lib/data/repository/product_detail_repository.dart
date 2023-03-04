import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/datasource/product_datasource.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';
import '../datasource/detail_product_datasource.dart';

abstract class IDetailRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
}

class ProductImageRepository extends IDetailRepository {
  final IDetailProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async {
    try {
      var response = await _datasource.getGallary();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
