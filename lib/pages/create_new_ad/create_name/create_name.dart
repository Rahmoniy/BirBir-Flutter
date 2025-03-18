import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:bir_bir/pages/create_new_ad/create_name/widgets/dropdown_card.dart';
import 'package:bir_bir/pages/create_new_ad/create_name/widgets/input_card.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateName extends StatefulWidget {
  const CreateName({super.key});

  @override
  State<CreateName> createState() => _AddNewNameState();
}

class _AddNewNameState extends State<CreateName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    void goNextPage() {
      context.read<CreateNewAdCubit>().setName(inputController.text);
      context.push('/create_price');
    }
    // late String currentChoice;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ведите называние объевления',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              InputCard(onChange: (val) => {}, controller: inputController),
              const SizedBox(
                height: 20,
              ),
              const DropdownCard(),
              const Spacer(),
              AppButton(
                onTap: goNextPage,
                title: 'Продолжить',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
