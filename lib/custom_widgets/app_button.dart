import 'package:bir_bir/assets/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function() onTap;
  final double width;
  final EdgeInsetsGeometry padding;
  final String title;
  final Color bgColor;
  final Color titleColor;
  final double titleSize;
  final Widget? child;

  const AppButton(
      {super.key,
      required this.onTap,
      this.width = double.infinity,
      this.padding = const EdgeInsets.symmetric(vertical: 15),
      this.title = 'Button',
      this.bgColor = AppColors.primary,
      this.titleColor = AppColors.white,
      this.titleSize = 16,
      this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: bgColor.withOpacity(0.1),
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          width: width,
          // constraints: BoxConstraints(minHeight: height),
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: child ??
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: titleSize,
                      color: titleColor),
                ),
          )),
    );
  }
}
