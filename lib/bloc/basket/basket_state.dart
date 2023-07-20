import 'package:dartz/dartz.dart';

import '../../data/model/basket_item.dart';

abstract class BasketState {}

class InitBasketState extends BasketState {}

class FetchDataBasketState extends BasketState {
  Either<String, List<BasketItem>> getAllBasketItem;
  FetchDataBasketState(this.getAllBasketItem);
}
