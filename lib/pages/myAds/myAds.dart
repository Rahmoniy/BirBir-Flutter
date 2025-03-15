import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:bir_bir/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Myads extends StatelessWidget {
  const Myads({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 150, 180, 0),
            child: CustomText(
              'Здесь будет ваши объяления и черновеки',
              isBold: true,
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/10918/10918615.png',
            height: 200,
          ),
          const Spacer(),
          CustomTouchableCard(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            onTap: () {
              context.push('/add_new');
            },
            bgColor: Colors.pink,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                CustomText(
                  'Поставить объевления',
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
