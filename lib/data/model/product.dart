class Products {
  String categoryId;
  String collectionId;
  String collectionName;
  String description;
  int discount_price;
  String id;
  String name;
  String popularity;
  int price;
  int quantity;
  String thumbnail;
  int? realPrice;
  num? persent;
  Products(
    this.categoryId,
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
  ) {
    realPrice = discount_price + price;
    persent = ((price - realPrice!) / price) * 100;
  }
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
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
