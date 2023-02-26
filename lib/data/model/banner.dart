class Banner {
  String? id;
  String? collectionId;
  String? collectionName;
  String? thumbnail;
  Banner(this.collectionId, this.collectionName, this.id, this.thumbnail);
  factory Banner.fromJson(Map<String, dynamic> jsonObject) {
    return Banner(
      jsonObject['id'],
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
