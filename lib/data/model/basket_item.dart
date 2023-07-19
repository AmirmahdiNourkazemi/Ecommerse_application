import 'package:hive/hive.dart';
part 'basket_item.g.dart';

@HiveType(typeId: 0)
class BasketItem {
  @HiveField(0)
  String collectionId;
  @HiveField(1)
  int discount_price;
  @HiveField(2)
  String id;
  @HiveField(3)
  String name;
  @HiveField(4)
  int price;
  @HiveField(5)
  String thumbnail;
  @HiveField(6)
  int? realPrice;
  @HiveField(7)
  num? persent;
  BasketItem(
    this.collectionId,
    this.discount_price,
    this.id,
    this.name,
    this.price,
    this.thumbnail,
  ) {
    realPrice = discount_price + price;
    persent = ((price - realPrice!) / price) * 100;
  }
}
