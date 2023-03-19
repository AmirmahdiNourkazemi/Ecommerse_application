abstract class ProductEvent {}

class ProductGetInitializedData extends ProductEvent {
  String productId;
  String categoryId;
  ProductGetInitializedData(this.productId,this.categoryId);
}
