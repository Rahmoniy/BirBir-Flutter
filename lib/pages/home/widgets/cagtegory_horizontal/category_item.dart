import 'package:bir_bir/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.img,
    required this.name,
  });

  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      clipBehavior: Clip.hardEdge,
      height: 50,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 239, 239),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {
          context.push('/category_product', extra: name);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Image.network(
                img,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomText(
                name,
                color: const Color.fromARGB(255, 42, 42, 42),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
