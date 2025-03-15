import 'package:bir_bir/custom_widgets/app_button.dart';
import 'package:bir_bir/pages/create_new_ad/create_price/widgets/main_card.dart';
import 'package:bir_bir/pages/create_new_ad/create_price/widgets/switch_card.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePrice extends StatefulWidget {
  const CreatePrice({super.key});

  @override
  State<CreatePrice> createState() => _AddNewPriceState();
}

class _AddNewPriceState extends State<CreatePrice> {
  bool isFree = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController priceController = TextEditingController();

    void onFree(bool value) {
      setState(() {
        context.read<CreateNewAdCubit>().setIsFree(value);
        isFree = value;
      });
    }

    void goToNextPage() {
      context
          .read<CreateNewAdCubit>()
          .setPrice(int.parse(priceController.text.replaceAll(' ', '')));
      context.read<CreateNewAdCubit>().saveProduct();
      context.push('/');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Укажите условия сделки',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SwitchCard(
              title: 'Отдам даром',
              onChanged: onFree,
              value: isFree,
              imgSrc:
                  'https://cdn.amasty.com/media/catalog/product/cache/8b14a410c096e2fc1a81f19ab33fad4c/f/r/free-gift-for-magento-2_627a6860de3db.png',
            ),
            isFree
                ? const SizedBox.shrink()
                : MainCard(priceController: priceController),
            const Spacer(),
            AppButton(
              onTap: goToNextPage,
              title: 'Продолжить',
            )
          ],
        ),
      )),
    );
  }
}
