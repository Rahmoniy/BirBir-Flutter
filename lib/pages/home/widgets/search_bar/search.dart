import 'package:bir_bir/app_widgets/app_widgets.dart';
import '../../../../../assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              tapTargetSize: MaterialTapTargetSize
                  .shrinkWrap, // Reduce the tap area to content size
              minimumSize: const Size(0, 0),
            ),
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                AppText(
                  'Вся страна',
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ],
            ),
          ),
          AppTouchableCard(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            onTap: () {
              context.push('/search');
            },
            child: const Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                AppText(
                  'Найти микроволновку',
                  color: Colors.grey,
                  fontSize: 16,
                )
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: const Color.fromARGB(255, 243, 239, 239),
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(15),
          //       child:
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
