import 'package:bir_bir/custom_widgets/custom_text.dart';

import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:bir_bir/pages/home/widgets/cagtegory_horizontal/category_list.dart';
import 'package:bir_bir/pages/home/widgets/carousel/carousel.dart';
import 'package:bir_bir/pages/home/widgets/product/product_vertical_list.dart';
import 'package:bir_bir/pages/home/widgets/search_bar/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<CreateNewAdCubit>().state;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Makes status bar transparent
        statusBarIconBrightness:
            Brightness.dark, // Ensures dark icons in the status bar
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            // Carousel at the top
            const SliverToBoxAdapter(
              child: Carousel(),
            ),

            // Search bar (sticky header)
            SliverPersistentHeader(
              pinned: true, // Makes the Search widget stick to the top
              floating: false,
              delegate: _SliverAppBarDelegate(
                child: const Search(),
              ),
            ),

            // Category List (static section)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: CategoryList(),
              ),
            ),

            // Category List (static section)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 15),
                child: CustomText(
                  'Интересное 🔥',
                  isBold: true,
                  fontSize: 20,
                ),
              ),
            ),

            // Product Vertical List (scrollable grid)
            products.isNotEmpty
                ? const SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    sliver: ProductVerticalList(),
                  )
                : const SliverToBoxAdapter(
                    child: Center(
                    child: Text('empty'),
                  ))
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 111; // Fixed height for the sticky header
  @override
  double get minExtent => 111; // Fixed height for the sticky header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
