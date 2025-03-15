import 'package:bir_bir/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteProductsNorifier extends StateNotifier<List<ProductModel>> {
  FavoriteProductsNorifier() : super([]);

  bool toggleProductFavoriteStatus(ProductModel product) {
    final isProductFavorite = state.contains(product);

    if (isProductFavorite) {
      state = state.where((element) {
        return element.id != product.id;
      }).toList();
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }
}

final favoriteProductsProvider =
    StateNotifierProvider<FavoriteProductsNorifier, List<ProductModel>>((ref) {
  return FavoriteProductsNorifier();
});
