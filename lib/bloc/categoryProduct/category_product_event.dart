abstract class CategoryProductEvent {}

class CategoryProductInitializa extends CategoryProductEvent {
  String catrgoryId;
  CategoryProductInitializa(this.catrgoryId);
}
