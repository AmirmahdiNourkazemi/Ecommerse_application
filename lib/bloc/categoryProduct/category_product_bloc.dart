import 'package:bloc/bloc.dart';
import 'package:mobile_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:mobile_shop/data/repository/category_product_repository.dart';
import 'package:mobile_shop/di/di.dart';

import 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final ICategoryProductRepository _repository = locator.get();
  CategoryProductBloc() : super(CategoryProductLoadingState()) {
    on<CategoryProductInitializa>((event, emit) async {
      var response = await _repository.getProductByCategoryId(event.catrgoryId);
      emit(CategoryProductResponseSuccessState(response));
    });
  }
}
