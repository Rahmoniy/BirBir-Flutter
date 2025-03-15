import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bir_bir/models/product_model.dart';

class CreateNewAdCubit extends Cubit<List<ProductModel>> {
  CreateNewAdCubit() : super([]);

  ProductModel _currentProduct = ProductModel(
    name: '',
    price: 0,
    images: [],
    category: '',
    currency: CurrencyType.sum,
    city: 'Tashkent',
  );

  void setImages(List<File> imagePaths) {
    _currentProduct = _currentProduct.copyWith(images: imagePaths);
  }

  void setName(String name) {
    _currentProduct = _currentProduct.copyWith(name: name);
  }

  void setCategory(String category) {
    _currentProduct = _currentProduct.copyWith(category: category);
  }

  void setPrice(num price) {
    _currentProduct = _currentProduct.copyWith(price: price);
  }

  void setIsFree(bool isFree) {
    _currentProduct = _currentProduct.copyWith(isFree: isFree);
  }

  void setIsUrgent(bool isUrgent) {
    _currentProduct = _currentProduct.copyWith(isUrgent: isUrgent);
  }

  void setCurrency(CurrencyType currency) {
    _currentProduct = _currentProduct.copyWith(currency: currency);
  }

  void saveProduct() {
    emit([...state, _currentProduct]);

    _currentProduct = ProductModel(
      name: '',
      price: 0,
      images: [],
      category: '',
      city: 'Tashkent',
      currency: CurrencyType.sum,
      isFree: false,
      isUrgent: false,
    );
  }
}
