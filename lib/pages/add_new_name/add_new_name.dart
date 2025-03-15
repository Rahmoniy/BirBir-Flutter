import 'package:bir_bir/pages/add_new/cubit/add_product_cubit.dart';
import 'package:bir_bir/pages/add_new_price/add_new_price.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/app_input.dart';
import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<String> _categoryList = [
  'Бытовая техника',
  'Электроника',
  'Мебель и интерьер',
  'Кросата и здаровья',
  'Аксасуары и украшения',
  'Для детей'
];

class AddNewName extends StatefulWidget {
  const AddNewName({super.key});

  @override
  State<AddNewName> createState() => _AddNewNameState();
}

class _AddNewNameState extends State<AddNewName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    // late String currentChoice;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(height: 20),
              const Text(
                'Ведите называние объевления',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              AppInput(
                controller: inputController,
                onChange: (val) => {},
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    inputController.text.length.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Text(
                    '/50',
                    style: TextStyle(color: AppColors.grey, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const DropdownButtonExample(),
              const Spacer(),
              CustomTouchableCard(
                onTap: () {
                  context.read<AddProductCubit>().setName(inputController.text);
                  context.push('/add_new_price');
                },
                padding: const EdgeInsets.symmetric(vertical: 15),
                bgColor: AppColors.primary,
                child: const Text(
                  'Продолжить',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputCard extends StatefulWidget {
  const InputCard({super.key, required this.onChange});

  final Function(String value) onChange;

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppInput(
        controller: inputController,
        onChange: (value) => {widget.onChange(value), setState(() {})},
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            inputController.text.length.toString(),
            style: TextStyle(fontSize: 16),
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

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = _categoryList[1];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.lightGrey),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          isExpanded: true,
          // elevation: 16,
          style: const TextStyle(
              color: AppColors.grey, fontWeight: FontWeight.w700, fontSize: 16),
          onChanged: (String? value) {
            context.read<AddProductCubit>().setCategory(value!);
            setState(() {
              dropdownValue = value;
            });
          },
          items: _categoryList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: AppColors.grey, fontSize: 16),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
