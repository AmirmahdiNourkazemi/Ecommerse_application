class Category {
  String? collectionId;
  String? title;
  String? color;
  String? icon;
  String? id;
  String? thumbnail;

  Category(
    this.collectionId,
    this.color,
    this.icon,
    this.id,
    this.thumbnail,
    this.title,
  );
  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category(
      jsonObject['collectionId'],
      jsonObject['color'],
      jsonObject['icon'],
      jsonObject['id'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['title'],
    );
  }
}
