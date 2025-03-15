import '../../assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.controller,
    required this.onChange,
    this.hintText = 'Matn kiriting...',
    this.prefixIcon,
    this.bgColor = AppColors.lightGrey,
    this.keyboardType,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final void Function(String) onChange;
  final String hintText;
  final Widget? prefixIcon;
  final Color bgColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChange,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                hintStyle: const TextStyle(color: AppColors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          // const Spacer(),
          // IconButton(
          //     onPressed: () => print('cancel Pressed'),
          //     icon: const Icon(
          //       Icons.cancel_outlined,
          //       color: AppColors.grey,
          //     ))
        ],
      ),
    );
  }
}
