import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<String> _categoryList = [
  'Бытовая техника',
  'Электроника',
  'Мебель и интерьер',
  'Кросата и здаровья',
  'Аксасуары и украшения',
  'Для детей'
];

class DropdownCard extends StatefulWidget {
  const DropdownCard({super.key});

  @override
  State<DropdownCard> createState() => _DropdownCardState();
}

class _DropdownCardState extends State<DropdownCard> {
  String dropdownValue = _categoryList[0];

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
            context.read<CreateNewAdCubit>().setCategory(value!);
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
