import 'package:bir_bir/pages/home/widgets/cagtegory_horizontal/category_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'img':
            'https://images.samsung.com/is/image/samsung/p6pim/uk/ww11dg5b25aeeu/gallery/uk-ww5000d-513179-ww11dg5b25aeeu-thumb-542320136',
        'name': 'Бытовая техника'
      },
      {
        'img':
            'https://cdn0.it4profit.com/s3size/rt:fill/w:900/h:900/g:no/el:1/f:webp/plain/s3://cms/product/3a/1e/3a1ef89dbd056392005736bc806f2e9b/240911100040721473.webp',
        'name': 'Электроника'
      },
      {
        'img':
            'https://www.jatijeparamebel.com/wp-content/uploads/2020/05/Slide-JJM1.png',
        'name': 'Мебель и интерьер'
      },
      {
        'img':
            'https://olcha.uz/image/original/category/RJNc7zGgrShtNTEcxnQBeyjpdmrtSRQuXCJedZnRHMYAD3keLnWSrtx5J7U0.',
        'name': 'Кросата и здаровья'
      },
      {
        'img':
            'https://inventstore.in/wp-content/uploads/2023/09/watch-ultra-double-1.webp',
        'name': 'Аксасуары и украшения'
      },
      {
        'img': 'https://toyishland.com/wp-content/uploads/2021/01/2-1.png',
        'name': 'Для детей'
      },
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Birinchi qator
          Row(
            // direction: Axis.horizontal,
            children: items.sublist(0, (items.length / 2).ceil()).map((item) {
              return CategoryItem(
                img: item['img'] ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScVBtGlUBBf6ii7ExQ8Zp9Ic9vsifhcDgv4A&s',
                name: item['name'] ?? 'Noma’lum',
              );
            }).toList(),
          ),
          // Ikkinchi qator
          Row(
            // direction: Axis.horizontal,
            children: items.sublist((items.length / 2).ceil()).map((item) {
              return CategoryItem(
                img: item['img'] ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScVBtGlUBBf6ii7ExQ8Zp9Ic9vsifhcDgv4A&s',
                name: item['name'] ?? 'Noma’lum',
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
