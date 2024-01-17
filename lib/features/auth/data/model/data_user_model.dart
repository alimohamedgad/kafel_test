import 'tags_user_model.dart';
import 'typ_user_model.dart';

class DataUserModel {
  DataUserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
    this.password,
  });
  final int? id;
  final String firstName;
  final String lastName;
  final String? password;
  final String about;
  final List<TagsUserModel> tags;
  final List<String> favoriteSocialMedia;
  final int salary;
  final String email;
  final dynamic birthDate;
  final int gender;
  final TypeUserModel type;
  final String avatar;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      'tags': tags.map((e) => e).toList(),
      'favorite_social_media': favoriteSocialMedia,
      'salary': salary,
      'email': email,
      'birth_date': birthDate,
      'gender': gender,
      'type': type,
      'avatar': avatar,
      'password': password,
    };
  }

  factory DataUserModel.fromMap(dynamic map) {
    return DataUserModel(
      id: map['id'] as int,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      about: map['about'] ?? '',
      tags:
          List.from(map['tags']).map((e) => TagsUserModel.fromMap(e)).toList(),
      favoriteSocialMedia: List<String>.from(
        (map['favorite_social_media'] ?? []),
      ),
      salary: map['salary'] as int,
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      birthDate: map['birth_date'],
      gender: map['gender'] as int,
      type: TypeUserModel.fromMap(map['type']),
      avatar: map['avatar'] ?? '',
    );
  }
}
