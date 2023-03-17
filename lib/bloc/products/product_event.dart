abstract class ProductEvent {}

class ProductGetInitializedData extends ProductEvent {
  String productId;
  ProductGetInitializedData(this.productId);
}
