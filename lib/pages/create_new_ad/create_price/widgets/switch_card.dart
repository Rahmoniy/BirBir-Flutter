import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:flutter/material.dart';

class SwitchCard extends StatelessWidget {
  const SwitchCard({
    super.key,
    required this.onChanged,
    required this.value,
    required this.imgSrc,
    required this.title,
  });
  final void Function(bool) onChanged;
  final bool value;
  final String imgSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomTouchableCard(
      height: 70,
      onTap: () {},
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network(
            imgSrc,
            height: 50,
            // width: 30,
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          const Spacer(),
          Switch(
            value: value,
            activeColor: AppColors.white,
            activeTrackColor: AppColors.black,
            inactiveTrackColor: AppColors.grey,
            onChanged: onChanged,
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
    ;
  }
}
