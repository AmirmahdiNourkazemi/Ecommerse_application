class Properties {
  String id;
  String product_id;
  String title;
  String value;
  Properties(this.id, this.product_id, this.title, this.value);
  factory Properties.fromJson(Map<String, dynamic> jsonObject) {
    return Properties(
      jsonObject['id'],
      jsonObject['product_id'],
      jsonObject['title'],
      jsonObject['value'],
    );
  }
}
