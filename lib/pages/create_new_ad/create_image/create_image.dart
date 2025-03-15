import 'dart:io';
import 'package:bir_bir/custom_widgets/app_button.dart';
import 'package:bir_bir/pages/create_new_ad/create_image/widgets/select_images.dart';
import 'package:bir_bir/pages/create_new_ad/cubit/create_new_ad_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CreateImage extends StatefulWidget {
  const CreateImage({super.key});

  @override
  State<CreateImage> createState() => _AddNewState();
}

class _AddNewState extends State<CreateImage> {
  List<XFile> selectedImages = [];
  void updateSelectedImages(List<XFile> images) {
    setState(() {
      selectedImages = images;
    });
  }

  void goToNextPage() {
    context
        .read<CreateNewAdCubit>()
        .setImages(selectedImages.map((el) => File(el.path)).toList());
    context.push('/create_name');
  }

  @override
  Widget build(BuildContext context) {
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
                    'Добавьте фото объевления',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Можно добавить от 1 до 6 фото. Фото должно быть меньше 10 мб и с разрешением не ниже 300×300.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  SelectImages(
                    onSelectImage: updateSelectedImages,
                  ),
                  const SizedBox(height: 15),
                  AppButton(
                    onTap: goToNextPage,
                    title: 'Продолжить',
                  ),
                ],
              ))),
    );
  }
}
