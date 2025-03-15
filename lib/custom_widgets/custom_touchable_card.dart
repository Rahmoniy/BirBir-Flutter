import '../../assets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTouchableCard extends StatelessWidget {
  const CustomTouchableCard({
    super.key,
    this.child = const Text('button child', style: TextStyle(fontSize: 20)),
    this.bgColor = AppColors.lightGrey,
    this.padding = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 10,
    required this.onTap,
  });

  final Widget child;
  final double width;
  final double height;
  final Color bgColor;
  final EdgeInsetsGeometry padding;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          // splashColor: bgColor.withOpacity(0.1),
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: width,
            constraints: BoxConstraints(minHeight: height),
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
