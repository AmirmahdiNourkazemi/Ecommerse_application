import 'package:mobile_shop/data/model/product.dart';

abstract class ProductEvent {}

class ProductGetInitializedData extends ProductEvent {
  String productId;
  String categoryId;
  ProductGetInitializedData(this.productId, this.categoryId);
}

class AddProductToBasket extends ProductEvent {
  Products products;
  AddProductToBasket(this.products);
}
