// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CountriesModel extends Equatable {
  final int? id;
  final String countryCode;
  final String name;
  final String capital;
  const CountriesModel({
    this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'countryCode': countryCode,
      'name': name,
      'capital': capital,
    };
  }

  factory CountriesModel.fromMap(Map<String, dynamic> map) {
    return CountriesModel(
      id: map['id'] != null ? map['id'] as int : null,
      countryCode: map['countryCode'] ?? '',
      name: map['name'] ?? "",
      capital: map['capital'] ?? "",
    );
  }
  @override
  List<Object> get props => [id!, countryCode, name, capital];
}
