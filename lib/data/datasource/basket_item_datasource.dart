import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../util/api_exeption.dart';
import '../model/basket_item.dart';

abstract class IbasketDatasource {
  Future<void> addBasket(BasketItem basketItem);
  Future<List<BasketItem>> getAllBasketItem();
}

class BasketDatasource extends IbasketDatasource {
  @override
  var box = Hive.box<BasketItem>('BasketBox');
  Future<void> addBasket(BasketItem basketItem) async {
    box.add(basketItem);
  }

  @override
  Future<List<BasketItem>> getAllBasketItem() async {
    try {
      var bsketList = await box.values.toList();
      return bsketList;
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
