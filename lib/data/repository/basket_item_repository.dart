import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/datasource/basket_item_datasource.dart';
import 'package:mobile_shop/data/model/basket_item.dart';
import 'package:mobile_shop/di/di.dart';

abstract class IBasketItemRepository {
  Future<Either<String, String>> addProductToBasket(BasketItem basketItem);
  Future<Either<String, List<BasketItem>>> getAllBasketItem();
}

class BasketRepository extends IBasketItemRepository {
  final IbasketDatasource _datasource = locator.get();
  Future<Either<String, String>> addProductToBasket(
      BasketItem basketItem) async {
    try {
      _datasource.addBasket(basketItem);
      return right("محصول با موفقیت اضافه شد.");
    } catch (e) {
      return left("خطا در اضافه کردن محصول");
    }
  }

  @override
  Future<Either<String, List<BasketItem>>> getAllBasketItem() async {
    try {
      var listBasket = await _datasource.getAllBasketItem();
      return right(listBasket);
    } catch (e) {
      return left("خطا در نمایش محصول");
    }
  }
}
