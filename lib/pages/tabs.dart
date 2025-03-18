import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/pages/home/home.dart';
import 'package:bir_bir/pages/likedProduct/liked_product.dart';
import 'package:bir_bir/pages/my_ads/my_ads.dart';
import 'package:bir_bir/pages/profile/profile.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreensState();
  }
}

class _TabsScreensState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _onSelectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _activeScreen = const Home();

    if (_selectedScreenIndex == 1) {
      _activeScreen = const Myads();
    }
    if (_selectedScreenIndex == 2) {
      _activeScreen = ProfileScreen(
        onNavigate: () => setState(() {
          _activeScreen = LikedProduct();
        }),
      );
    }

    return Scaffold(
      body: _activeScreen,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: AppColors.primary,
            backgroundColor: AppColors.white,
            unselectedItemColor: AppColors.grey,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          onTap: _onSelectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Поставить',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}
