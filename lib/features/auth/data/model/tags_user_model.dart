// ignore_for_file: public_member_api_docs, sort_constructors_first
class TagsUserModel {
  TagsUserModel({
    this.id,
    this.name,
  });
  final int? id;
  final String? name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory TagsUserModel.fromMap(dynamic map) {
    return TagsUserModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
