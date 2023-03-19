import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/product_variant.dart';
import 'package:mobile_shop/data/model/varient_type.dart';

abstract class ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailInitState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> getImageProduct;
  Either<String, List<ProductVarient>> productVarient;
  Either<String, Category> getCategoryProduct;
  ProductDetailResponseState(this.getImageProduct, this.productVarient,this.getCategoryProduct);
}
