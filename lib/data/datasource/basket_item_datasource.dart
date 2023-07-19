import 'dart:ffi';

import 'package:hive/hive.dart';

import '../model/basket_item.dart';

abstract class IbasketDatasource {
  Future<void> addBasket(BasketItem basketItem);
}

class BasketDatasource extends IbasketDatasource {
  @override
  var box = Hive.box<BasketItem>('BasketBox');
  Future<void> addBasket(BasketItem basketItem) async {
    box.add(basketItem);
  }
}
