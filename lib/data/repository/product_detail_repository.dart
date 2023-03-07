import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/datasource/product_datasource.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/product_variant.dart';
import 'package:mobile_shop/data/model/varient_type.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';
import '../datasource/detail_product_datasource.dart';

abstract class IDetailRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
   Future<Either<String, List<VarientType>>> getVarientType();
   Future<Either<String, List<ProductVarient>>> getProductVarientType();
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
  
  @override
  Future<Either<String, List<VarientType>>> getVarientType() async{
    try {
      var response = await _datasource.getVarientTypes();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
  
  @override
  Future<Either<String, List<ProductVarient>>> getProductVarientType() async{
      try {
      var response = await _datasource.getProductVarient();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

}
