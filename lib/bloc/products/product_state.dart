import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/model/product_image.dart';

abstract class ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailInitState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> getImageProduct;
  ProductDetailResponseState(this.getImageProduct);
}
