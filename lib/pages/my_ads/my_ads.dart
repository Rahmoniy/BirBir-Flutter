import 'package:bir_bir/app_widgets/app_widgets.dart';
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
            child: AppText(
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
          AppButton(
            onTap: () => context.push('/create_image'),
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
                AppText(
                  'Поставить объевления',
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
