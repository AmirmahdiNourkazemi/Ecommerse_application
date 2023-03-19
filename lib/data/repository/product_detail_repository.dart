import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/datasource/product_datasource.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/product_variant.dart';
import 'package:mobile_shop/data/model/varient_type.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';
import '../datasource/detail_product_datasource.dart';

abstract class IDetailRepository {
  Future<Either<String, List<ProductImage>>> getProductImage(String productId);
  Future<Either<String, List<VarientType>>> getVarientType(String productId);
  Future<Either<String, List<ProductVarient>>> getProductVarientType(String productId);
  Future<Either<String, Category>> getProductCategory(String categoryId);
}

class ProductImageRepository extends IDetailRepository {
  final IDetailProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage(String productId) async {
    try {
      var response = await _datasource.getGallary(productId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VarientType>>> getVarientType(String productId) async {
    try {
      var response = await _datasource.getVarientTypes(productId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVarient>>> getProductVarientType(productId) async {
    try {
      var response = await _datasource.getProductVarient(productId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
  
  @override
  Future<Either<String, Category>> getProductCategory(String categoryId) async{
     try {
      var response = await _datasource.getProductCategory(categoryId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
