import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://static.vecteezy.com/system/resources/thumbnails/012/488/038/small_2x/like-3d-illustration-png.png',
                height: 200,
              ),
              const AppText(
                'Вы пока ничего не сохранили',
                isBold: true,
                fontSize: 20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const AppText(
                'Сохраняйте объявления в избранное, чтобы ничего не упустить',
                fontSize: 14,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              AppTouchableCard(
                onTap: () {},
                bgColor: const Color.fromARGB(255, 220, 71, 121),
                child: const AppText(
                  'К поиску объевление',
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
