import 'dart:io';

import 'package:uuid/uuid.dart';

enum CurrencyType { usd, sum }

class ProductModel {
  final String id;
  final String name;
  final String category;
  final List<File> images;
  final num price;
  final String city;
  final String postedTime;
  final bool isFree;
  final bool isUrgent;
  final CurrencyType currency;

  ProductModel({
    String? id,
    required this.name,
    required this.category,
    required this.images,
    required this.city,
    required this.currency,
    this.price = 0,
    this.isFree = false,
    this.isUrgent = false,
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
    CurrencyType? currency,
    bool? isFree,
    bool? isUrgent,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      images: images ?? this.images,
      price: price ?? this.price,
      city: city ?? this.city,
      currency: currency ?? this.currency,
      postedTime: postedTime ?? this.postedTime,
      isFree: isFree ?? this.isFree,
      isUrgent: isUrgent ?? this.isUrgent,
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
      'isFree': isFree,
      'isUrgent': isUrgent,
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
      currency: json['currency'],
      isFree: json['isFree'],
      isUrgent: json['isUrgent'],
    );
  }

  @override
  String toString() {
    return 'ProductModel(\nid: $id,\nname: $name,\ncategory: $category,\nprice: $price,\ncity: $city,\npostedTime: $postedTime,\nisFree: $isFree,\nisUrgent: $isUrgent,\ncurrency: $currency)';
  }
}
