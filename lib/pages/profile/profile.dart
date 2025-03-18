import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:bir_bir/pages/likedProduct/liked_product.dart';
import 'package:flutter/material.dart';
import 'package:bir_bir/pages/auth/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.onNavigate});

  final void Function() onNavigate;

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Widget _activeScreen;

  @override
  void initState() {
    super.initState();
    _activeScreen = MainProfileScreen(
      onChangeScreen: onChangeScreen,
    );
  }

  void onChangeScreen() {
    setState(() {
      _activeScreen = LikedProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _activeScreen;
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.text,
    required this.img,
    required this.onTap,
  });

  final String text;
  final String img;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return AppTouchableCard(
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
      width: (screenWidth - 40) / 2,
      height: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text,
            fontSize: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class PaddingCard extends StatelessWidget {
  const PaddingCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
  });
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

class ProfileSettingCard extends StatelessWidget {
  const ProfileSettingCard(
      {super.key,
      required this.imgSrc,
      required this.text,
      this.bgColor = const Color.fromARGB(255, 243, 239, 239),
      this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 15)});

  final String imgSrc;
  final Color bgColor;
  final String text;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return AppTouchableCard(
      onTap: () {},
      bgColor: Colors.transparent,
      padding: padding,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColor,
            ),
            child: Image.network(
              imgSrc,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          AppText(
            text,
            fontSize: 18,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_right,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key, required this.onChangeScreen});

  final void Function() onChangeScreen;

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return Container(
      color: const Color.fromARGB(255, 243, 239, 239),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PaddingCard(
              child: SafeArea(
                top: true,
                child: Center(
                  child: Column(
                    children: [
                      const AppText(
                        'Мой профиль',
                        isBold: true,
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          ProfileCard(
                            text: 'Избранное',
                            img:
                                'https://cdn-icons-png.flaticon.com/512/8249/8249304.png',
                            onTap: onChangeScreen,
                          ),
                          const Spacer(),
                          ProfileCard(
                            onTap: () {},
                            text: 'Мои объевление',
                            img:
                                'https://cdn-icons-png.flaticon.com/512/8249/8249304.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const PaddingCard(
              padding: EdgeInsets.zero,
              child: ProfileSettingCard(
                  text: 'Bir Bir для бизнеса',
                  imgSrc:
                      'https://cdn-icons-png.flaticon.com/512/11671/11671417.png'),
            ),
            const SizedBox(
              height: 8,
            ),
            const PaddingCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ProfileSettingCard(
                    text: 'Служба поддержки',
                    imgSrc:
                        'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/335_Telegram_logo-512.png',
                    padding: EdgeInsets.fromLTRB(18, 15, 18, 7),
                  ),
                  ProfileSettingCard(
                    text: 'Смена языка',
                    imgSrc:
                        'https://s.cafebazaar.ir/images/icons/com.cathyw.uzru-0d302f70-3247-4762-9002-5b55ae9c7f99_512x512.png?x-img=v1/resize,h_256,w_256,lossless_false/optimize',
                    padding: EdgeInsets.fromLTRB(18, 8, 18, 7),
                  ),
                  ProfileSettingCard(
                    text: 'Правила Bir Bir',
                    imgSrc:
                        'https://static.thenounproject.com/png/684885-200.png',
                    padding: EdgeInsets.fromLTRB(18, 8, 18, 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: AppButton(
                onTap: () => authService.signOut(),
                title: 'Войти или регистрироваться',
              ),
            )
          ],
        ),
      ),
    );
  }
}
