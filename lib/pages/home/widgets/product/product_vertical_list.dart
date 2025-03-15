import 'package:bir_bir/custom_widgets/custom_text.dart';
import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';

import 'package:bir_bir/pages/home/widgets/product/product_item.dart';
import 'package:bir_bir/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductVerticalList extends ConsumerWidget {
  const ProductVerticalList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final availableProducts = ref.watch(productsProvider);
    final products = context.watch<CreateNewAdCubit>().state;

    return products.length > 0
        ? SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 5, // Space between columns
              mainAxisSpacing: 15, // Space between rows
              mainAxisExtent: 300, // Fixed height for each item
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProductItem(products[index]); // Your product item widget
              },
              childCount: products.length, // Total number of items
            ),
          )
        : Text('empty');
  }
}
