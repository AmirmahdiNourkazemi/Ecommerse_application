class Products {
  String category;
  String collectionId;
  String collectionName;
  String description;
  int discount_price;
  String id;
  String name;
  String popularity;
  String price;
  String quantity;
  String thumbnail;
  Products(
    this.category,
    this.collectionId,
    this.collectionName,
    this.description,
    this.discount_price,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
  );
  factory Products.fromJson(Map<String, dynamic> jsonObject) {
    return Products(
      jsonObject['category'],
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      jsonObject['description'],
      jsonObject['discount_price'],
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['popularity'],
      jsonObject['price'],
      jsonObject['quantity'],
      jsonObject['thumbnail'],
    );
  }
}
