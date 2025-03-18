import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int activePage = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product_detail', extra: widget.product);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImageSlider(
              src: widget.product.images,
              onFavoriteToggle: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              isFavorite: isFavorite,
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Text(
              '${widget.product.price.toString()} сум',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.city,
                      style: const TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                    Text(
                      widget.product.postedTime,
                      style: const TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                  ],
                ),
                AppButton(
                  onTap: () {},
                  width: 110,
                  title: 'Связаться',
                  padding: const EdgeInsets.symmetric(vertical: 5),
                )
                // CustomTouchableCard(

                //   width: 110,
                //   onTap: () {},
                //   child: Center(
                //     child: Text('Связаться'),
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
