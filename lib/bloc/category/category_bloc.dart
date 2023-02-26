import 'package:bloc/bloc.dart';

import '../../data/repository/category_repository.dart';
import '../../di/di.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator.get();
  CategoryBloc() : super(CategoryInitiateState()) {
    on<CategoryRequestList>(
      (event, emit) async {
        emit(CategoryLoadingState());
        var response = await _repository.getCategories();
        emit(CategoryResponseState(response));
      },
    );
  }
}
