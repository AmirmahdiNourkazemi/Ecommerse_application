class Category {
  String? collectionId;
  String? title;
  String? color;
  String? icon;
  String? id;
  String? thumbnail;

  Category(
    this.collectionId,
    this.title,
    this.color,
    this.icon,
    this.id,
    this.thumbnail,
  );
  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category(
      jsonObject['collectionId'],
      jsonObject['title'],
      jsonObject['color'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
      jsonObject['id'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
