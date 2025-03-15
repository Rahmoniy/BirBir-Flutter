import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/pages/category_detail/widgets/product_item.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:bir_bir/pages/search/widgets/search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetail extends StatelessWidget {
  final String categoryName;

  const CategoryDetail({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<CreateNewAdCubit>().state;
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
