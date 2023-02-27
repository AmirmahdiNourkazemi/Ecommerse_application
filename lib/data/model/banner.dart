class BannerCampain {
  String? id;
  String? collectionId;
  String? collectionName;
  String? thumbnail;
  BannerCampain(
      this.collectionId, this.collectionName, this.id, this.thumbnail);
  factory BannerCampain.fromJson(Map<String, dynamic> jsonObject) {
    return BannerCampain(
      jsonObject['id'],
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
