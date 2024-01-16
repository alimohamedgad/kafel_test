// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'data_user_model.dart';

class UserModel {
  UserModel({
    this.status,
    required this.data,
    this.accessToken,
  });
  final int? status;
  DataUserModel data;
  final String? accessToken;

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      status: json['status'],
      data: DataUserModel.fromMap(json['data']),
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
      'access_token': accessToken,
    };
  }
}
