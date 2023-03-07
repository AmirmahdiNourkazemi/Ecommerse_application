class VarientType {
  String? id;
  String? name;
  String? title;
  VarientTypeEnum? type;
  VarientType(this.id, this.name, this.title, this.type);
  factory VarientType.fromJson(Map<String, dynamic> jsonObject) {
    return VarientType(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      _getTypeEnum(jsonObject['type']),
    );
  }

}
  VarientTypeEnum _getTypeEnum(String type) {
    switch (type) {
      case 'Color':
        return VarientTypeEnum.COLOR;

      case 'Storage':
        return VarientTypeEnum.STORAGE;

      case 'Voltage':
        return VarientTypeEnum.VOLTAGE;
      default:
        return VarientTypeEnum.COLOR;
    }
  }
enum VarientTypeEnum { COLOR, STORAGE, VOLTAGE }
