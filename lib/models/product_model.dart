import 'dart:io';

import 'package:uuid/uuid.dart';

enum Product {
  householdAppliances,
  electronics,
  furnitureAndInterior,
  beauty,
  accessories,
  forChildren
}

class ProductModel {
  final String id;
  final String name;
  final String category;
  final List<File> images;
  final num price;
  final String city;
  final String postedTime;

  ProductModel({
    String? id,
    required this.name,
    required this.category,
    required this.images,
    required this.price,
    required this.city,
    String? postedTime,
  })  : id = id ?? const Uuid().v4(),
        postedTime = postedTime ?? DateTime.now().toIso8601String();

  // ✅ `copyWith` metodi - faqat o‘zgargan qiymatni almashtirish uchun
  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    List<File>? images,
    num? price,
    String? city,
    String? postedTime,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      images: images ?? this.images,
      price: price ?? this.price,
      city: city ?? this.city,
      postedTime: postedTime ?? this.postedTime,
    );
  }

  // ✅ `toJson` metodi - JSON formatiga o‘girish uchun
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'images': images,
      'price': price,
      'city': city,
      'postedTime': postedTime,
    };
  }

  // ✅ `fromJson` metodi - JSON'dan obyektga o‘girish
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      images: List<File>.from(json['images']),
      price: json['price'],
      city: json['city'],
      postedTime: json['postedTime'],
    );
  }

  @override
  String toString() {
    return 'ProductModel(\nid: $id,\nname: $name,\ncategory: $category,\nprice: $price,\ncity: $city,\npostedTime: $postedTime)';
  }
}
