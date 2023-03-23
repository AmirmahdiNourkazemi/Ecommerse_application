import 'package:dartz/dartz.dart';

import '../../data/model/product.dart';

abstract class CategoryProductState {}

class CategoryProductLoadingState extends CategoryProductState {}

class CategoryProductResponseSuccessState extends CategoryProductState {
  Either<String, List<Products>> productListByCategory;
  CategoryProductResponseSuccessState(this.productListByCategory);
}
