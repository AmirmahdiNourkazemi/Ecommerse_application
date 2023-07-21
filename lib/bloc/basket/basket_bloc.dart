import 'package:bloc/bloc.dart';
import 'package:mobile_shop/bloc/basket/basket_event.dart';
import 'package:mobile_shop/bloc/basket/basket_state.dart';
import 'package:mobile_shop/data/repository/basket_item_repository.dart';
import 'package:mobile_shop/di/di.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketItemRepository _basketRepository = locator.get();
  BasketBloc() : super(InitBasketState()) {
    on<GetInitBasketEvent>(
      (event, emit) async {
        var getAllBasketItem = await _basketRepository.getAllBasketItem();
        var showFinalPrice = await _basketRepository.finalPrice();
        emit(FetchDataBasketState(getAllBasketItem, showFinalPrice));
      },
    );
  }
}
