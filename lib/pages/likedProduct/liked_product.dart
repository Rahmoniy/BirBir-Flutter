import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/pages/home/widgets/product/product_item.dart';
import 'package:bir_bir/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikedProduct extends ConsumerWidget {
  LikedProduct({super.key});

  final List<ProductModel> _data = [
    ProductModel(
      id: '1',
      name: 'Valintono etik',
      category: 'boot',
      images: [
        // 'https://hudsonshoes.com/cdn/shop/files/RIPLEYBLACKSide.jpg?v=1695647261'
      ],
      price: 150000,
      city: 'Ташкент',
      postedTime: '14 ноябрья, 08:44',
    ),
    ProductModel(
      id: '2',
      name: 'Детские боди',
      category: 'clothe',
      images: [
        // 'https://olcha.uz/image/700x700/products/2022-06-22/detskie-bodi-15928-15931-9-mesyatsev-goluboy-60924-0.jpeg'
      ],
      price: 180000,
      city: 'Ташкент',
      postedTime: '14 ноябрья, 08:44',
    ),
    ProductModel(
      id: '3',
      name: 'Valintono etik',
      category: 'boot',
      images: [
        // 'https://hudsonshoes.com/cdn/shop/files/RIPLEYBLACKSide.jpg?v=1695647261'
      ],
      price: 170000,
      city: 'Ташкент',
      postedTime: '14 ноябрья, 08:44',
    ),
    ProductModel(
      id: '4',
      name: 'Детские боди',
      category: 'clothe',
      images: [
        // 'https://olcha.uz/image/700x700/products/2022-06-22/detskie-bodi-15928-15931-9-mesyatsev-goluboy-60924-0.jpeg'
      ],
      price: 120000,
      city: 'Ташкент',
      postedTime: '14 ноябрья, 08:44',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final Widget activeScreen;
    final availableProducts = ref.watch(productsProvider);

    return GridView.builder(
      itemCount: availableProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 5, // Space between columns
        mainAxisSpacing: 15, // Space between rows
        mainAxisExtent: 300, // Fixed height for each item
      ),
      itemBuilder: (context, index) {
        return ProductItem(availableProducts[index]);
      },
    );
  }
}
