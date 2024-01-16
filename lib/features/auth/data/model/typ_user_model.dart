class TypeUserModel {
  TypeUserModel({
    this.code,
    this.name,
    this.niceName,
  });
  final int? code;
  final String? name;
  final String? niceName;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'nice_name': niceName,
    };
  }

  factory TypeUserModel.fromMap(dynamic map) {
    return TypeUserModel(
      code: map['code'] as int,
      name: map['name'] ?? "",
      niceName: map['nice_name'] as String,
    );
  }
}
