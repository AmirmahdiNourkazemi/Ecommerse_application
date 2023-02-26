import 'package:dartz/dartz.dart';

import '../../data/model/category.dart';

abstract class CategoryState {}

class CategoryInitiateState extends CategoryState {}

class CategoryLoginState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Category>> response;
  CategoryResponseState(this.response);
}
