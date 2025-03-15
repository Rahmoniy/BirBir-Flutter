import 'package:bir_bir/data/dummy_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = Provider((ref) {
  return dummyProducts;
});
