import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/app_input.dart';
import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/pages/create_new_ad/create_price/widgets/switch_card.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MainCard extends StatefulWidget {
  const MainCard({super.key, required this.priceController});

  final TextEditingController priceController;

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  bool isUrgent = false;

  @override
  Widget build(BuildContext context) {
    void onUrgent(bool value) {
      setState(() {
        isUrgent = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const Text(
          'Цена',
          style: TextStyle(color: AppColors.grey, fontSize: 14),
        ),
        AppInput(
          controller: widget.priceController,
          onChange: (String value) {},
          hintText: '0',
          keyboardType: TextInputType.number,
          inputFormatters: [ThousandsFormatter()],
        ),
        const SizedBox(
          height: 5,
        ),
        const Tab(),
        const SizedBox(height: 20),
        SwitchCard(
          imgSrc: 'https://cdn-icons-png.flaticon.com/512/9296/9296739.png',
          onChanged: onUrgent,
          title: 'Отдам даром',
          value: isUrgent,
        ),
      ],
    );
  }
}

class Tab extends StatefulWidget {
  const Tab({super.key});

  @override
  State<Tab> createState() => _TabState();
}

class _TabState extends State<Tab> {
  bool switcher = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch.size(
      current: switcher,
      values: const [true, false],
      indicatorSize: const Size.fromWidth(200),
      customIconBuilder: (context, local, global) => Text(
        local.value ? 'Сум' : 'y.e',
        style: TextStyle(
          color: Color.lerp(Colors.black, AppColors.grey, local.animationValue),
        ),
      ),
      iconAnimationType: AnimationType.onHover,
      style: ToggleStyle(
        backgroundColor: AppColors.lightGrey,
        indicatorColor: AppColors.white,
        borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      onChanged: (value) => setState(() {
        switcher = value;
        context
            .read<CreateNewAdCubit>()
            .setCurrency(value ? CurrencyType.sum : CurrencyType.usd);
      }),
    );
  }
}

class ThousandsFormatter extends TextInputFormatter {
  final NumberFormat numberFormat =
      NumberFormat.decimalPattern(); // Uses default thousand separator

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters (e.g., spaces, commas)
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (newText.isEmpty) return newValue.copyWith(text: '');

    // Format with spaces as thousands separator
    String formattedText = newText.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]} ',
    );

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
