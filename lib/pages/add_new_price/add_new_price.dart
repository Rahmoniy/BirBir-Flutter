import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bir_bir/pages/add_new/cubit/add_product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/app_input.dart';
import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddNewPrice extends StatefulWidget {
  const AddNewPrice({super.key});

  @override
  State<AddNewPrice> createState() => _AddNewPriceState();
}

class _AddNewPriceState extends State<AddNewPrice> {
  bool isFree = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController priceController = TextEditingController();
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
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 20),
            const Text(
              'Укажите условия сделки',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ForFreeCard(
              onFreeChanged: (bool value) {
                isFree = value;
                setState(() {});
              },
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final slideAnimation = Tween<Offset>(
                  begin: isFree
                      ? const Offset(0, 0)
                      : const Offset(0, -1), // Up when hiding
                  end: isFree
                      ? const Offset(0, -1)
                      : const Offset(0, 0), // Down when showing
                ).animate(animation);

                return SlideTransition(position: slideAnimation, child: child);
              },
              child: isFree
                  ? const SizedBox.shrink() // Hide widget smoothly
                  : MyWidget(
                      priceController: priceController,
                      key: ValueKey('myWidget')), // Unique key to track changes
            ),
            const Spacer(),
            CustomTouchableCard(
              onTap: () {
                context.read<AddProductCubit>().setPrice(
                    int.parse(priceController.text.replaceAll(' ', '')));
                context.read<AddProductCubit>().saveProduct();
                context.push('/');
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
      )),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.priceController});

  final TextEditingController priceController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const Text(
          'Цена',
          style: TextStyle(color: AppColors.grey, fontSize: 14),
        ),
        AppInput(
          controller: priceController,
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
        const SellingUrgentlyCard(),
      ],
    );
  }
}

class ForFreeCard extends StatefulWidget {
  const ForFreeCard({super.key, required this.onFreeChanged});
  final ValueChanged<bool> onFreeChanged;

  @override
  State<ForFreeCard> createState() => _ForFreeCardState();
}

class _ForFreeCardState extends State<ForFreeCard> {
  bool isFree = false;

  @override
  Widget build(BuildContext context) {
    return SwitchCard(
      imgSrc:
          'https://cdn.amasty.com/media/catalog/product/cache/8b14a410c096e2fc1a81f19ab33fad4c/f/r/free-gift-for-magento-2_627a6860de3db.png',
      onChanged: (bool value) {
        setState(() {
          isFree = value;
        });
        widget.onFreeChanged(value);
      },
      title: 'Отдам даром',
      value: isFree,
    );
  }
}

class SellingUrgentlyCard extends StatefulWidget {
  const SellingUrgentlyCard({super.key});

  @override
  State<SellingUrgentlyCard> createState() => _SellingUrgentlyCard();
}

class _SellingUrgentlyCard extends State<SellingUrgentlyCard> {
  bool isUrgent = false;

  @override
  Widget build(BuildContext context) {
    return SwitchCard(
      imgSrc: 'https://cdn-icons-png.flaticon.com/512/9296/9296739.png',
      onChanged: (bool value) {
        setState(() {
          isUrgent = value;
        });
      },
      title: 'Отдам даром',
      value: isUrgent,
    );
  }
}

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
