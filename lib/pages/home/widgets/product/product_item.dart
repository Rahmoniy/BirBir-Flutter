import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/providers/favorite_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem(this.product, {super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfFavoriteProducts = ref.watch(favoriteProductsProvider);
    final isFavorite = listOfFavoriteProducts.contains(product);

    return GestureDetector(
      onTap: () {
        context.push('/product_detail', extra: product);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Image.file(
                  product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 5,
                left: 5,
                child: ProductBadge(
                  icon: Icon(
                    Icons.flash_on_sharp,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      final result = ref
                          .read(favoriteProductsProvider.notifier)
                          .toggleProductFavoriteStatus(product);
                      ScaffoldMessenger.of(context).clearSnackBars();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result
                              ? '${product.id} is added'
                              : '${product.id} is removed'),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 20,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          AppText(
            product.price.toString(),
            isBold: true,
            fontSize: 17,
          ),
          const SizedBox(
            height: 5,
          ),
          AppText(
            product.name,
            fontSize: 15,
          ),
          const SizedBox(
            height: 5,
          ),
          AppText(
            '${product.city}\n${product.postedTime}',
            color: Colors.grey,
            fontSize: 13,
          )
        ],
      ),
    );
  }
}
