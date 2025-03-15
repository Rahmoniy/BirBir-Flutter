import 'dart:io';

import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/pages/add_new/cubit/add_product_cubit.dart';
import 'package:bir_bir/pages/search/view/search_view.dart';
import 'package:bir_bir/pages/search/widgets/search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final products = context.watch<AddProductCubit>().state;
    final sorterProducts = products
        .where(
          (element) => element.category == categoryName,
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SearchHeader(
              bgColor: AppColors.lightGrey,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: sorterProducts.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: sorterProducts[index],
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

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
            ProductImageSlider(
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.product.name,
              style: TextStyle(
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
                      style: TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                    Text(
                      widget.product.postedTime,
                      style: TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                  ],
                ),
                CustomTouchableCard(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 110,
                  onTap: () {},
                  child: Center(
                    child: Text('Связаться'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatefulWidget {
  const ProductImage({super.key});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
    required this.onFavoriteToggle,
    required this.isFavorite,
    required this.src,
    this.height = 200,
  });

  final List<File> src;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;
  final double height;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.src.length,
                  onPageChanged: (index) {
                    setState(() {
                      activePage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.file(
                      widget.src[index],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: widget.onFavoriteToggle,
                    icon: Icon(
                      Icons.favorite,
                      color: widget.isFavorite ? Colors.red : Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        ActiveDot(length: widget.src.length, activeIndex: activePage),
      ],
    );
  }
}

class ActiveDot extends StatefulWidget {
  const ActiveDot({super.key, this.activeIndex = 0, required this.length});

  final int activeIndex;
  final int length;

  @override
  State<ActiveDot> createState() => _ActiveDotState();
}

class _ActiveDotState extends State<ActiveDot> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Nuqtalarni markazga joylashtirish
      children: List.generate(widget.length, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.activeIndex == index
                  ? AppColors.black
                  : AppColors.lightGrey),
        );
      }),
    );
  }
}
