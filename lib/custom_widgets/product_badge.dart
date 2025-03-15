import 'package:bir_bir/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductBadge extends StatelessWidget {
  const ProductBadge(
      {super.key, this.text = 'text', this.icon = const Icon(Icons.abc)});

  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 3, 6, 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.pink,
              maxRadius: 8,
              child: icon,
            ),
            const SizedBox(
              width: 5,
            ),
            const CustomText(
              'Выгода до 50%',
              color: Colors.blueGrey,
              fontSize: 10,
            )
          ],
        ),
      ),
    );
  }
}
