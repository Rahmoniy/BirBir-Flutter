import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/app_input.dart';
import 'package:flutter/material.dart';

class InputCard extends StatefulWidget {
  final Function(String value) onChange;
  final TextEditingController controller;

  const InputCard(
      {super.key, required this.onChange, required this.controller});

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppInput(
        controller: widget.controller,
        onChange: widget.onChange,
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.controller.text.length.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          const Text(
            '/50',
            style: TextStyle(color: AppColors.grey, fontSize: 16),
          ),
        ],
      )
    ]);
  }
}
