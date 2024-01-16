// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final int? id;
  final String mainImage;
  final int price;
  final String? discount;
  final int priceAfterDiscount;
  final int averageRating;
  final int completedSalesCount;
  final String title;
  final bool recommended;
  const ServiceModel({
    this.id,
    required this.mainImage,
    required this.price,
    this.discount,
    required this.priceAfterDiscount,
    required this.averageRating,
    required this.completedSalesCount,
    required this.title,
    required this.recommended,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mainImage': mainImage,
      'price': price,
      'discount': discount,
      'priceAfterDiscount': priceAfterDiscount,
      'averageRating': averageRating,
      'completedSalesCount': completedSalesCount,
      'title': title,
      'recommended': recommended,
    };
  }

  factory ServiceModel.fromMap(dynamic map) {
    return ServiceModel(
      id: map['id'] != null ? map['id'] as int : null,
      mainImage: map['main_image'] as String,
      price: map['price'] as int,
      discount: map['discount'] != null ? map['discount'] as String : null,
      priceAfterDiscount: map['price_after_discount'] as int,
      averageRating: map['average_rating'] as int,
      completedSalesCount: map['completed_sales_count'] as int,
      title: map['title'] as String,
      recommended: map['recommended'] as bool,
    );
  }

  @override
  List<Object> get props {
    return [
      id!,
      mainImage,
      price,
      discount!,
      priceAfterDiscount,
      averageRating,
      completedSalesCount,
      title,
      recommended,
    ];
  }
}
