import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bir_bir/models/product_model.dart';

class AddProductCubit extends Cubit<List<ProductModel>> {
  AddProductCubit() : super([]);

  ProductModel _currentProduct = ProductModel(
    name: '',
    price: 0,
    images: [],
    category: '',
    city: 'Tashkent',
  );

  void setImages(List<File> imagePaths) {
    _currentProduct = _currentProduct.copyWith(images: imagePaths);
    // print("🖼 Rasm qo‘shildi: ${_currentProduct.images}");
  }

  void setName(String name) {
    _currentProduct = _currentProduct.copyWith(name: name);
    // print("📛 Nom o‘zgardi: ${_currentProduct.name}");
  }

  void setCategory(String category) {
    _currentProduct = _currentProduct.copyWith(category: category);
  }

  void setPrice(num price) {
    _currentProduct = _currentProduct.copyWith(price: price);
    // print("💰 Narx o‘zgardi: ${_currentProduct}");
  }

  void saveProduct() {
    emit([...state, _currentProduct]); // Yangi mahsulot qo'shiladi
    print("📦 Yangi mahsulot qo‘shildi: ${_currentProduct.toJson()}");
    print("📋 Umumiy mahsulotlar ro‘yxati: $state");

    // Yangi mahsulot yaratish uchun _currentProduct ni bo‘sh qilib qo‘yamiz
    _currentProduct = ProductModel(
      name: '',
      price: 0,
      images: [],
      category: '',
      city: 'Tashkent',
    );
  }
}
