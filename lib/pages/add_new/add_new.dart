import 'dart:io';

import 'package:bir_bir/pages/add_new/cubit/add_product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  List<XFile> selectedImages = [];
  void updateSelectedImages(List<XFile> images) {
    setState(() {
      selectedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      icon: Icon(Icons.arrow_back)),
                  const SizedBox(height: 30),
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

                  AddNewImage(
                    onSelectImage: updateSelectedImages,
                  ),

                  // Pastda doim joylashadigan tugma

                  CustomTouchableCard(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    bgColor: AppColors.primary,
                    onTap: () {
                      context.read<AddProductCubit>().setImages(
                          selectedImages.map((el) => File(el.path)).toList());
                      context.push('/add_new_name', extra: selectedImages);
                    },
                    child: const Text(
                      'Продолжить',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ),
                ],
              ))),
    );
  }
}

class AddNewImage extends StatefulWidget {
  const AddNewImage({super.key, required this.onSelectImage});

  final Function(List<XFile>) onSelectImage;

  @override
  State<AddNewImage> createState() => _AddNewImageState();
}

class _AddNewImageState extends State<AddNewImage> {
  List<XFile> selectedImages = [];

  Future<void> pickImage() async {
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage(limit: 6);
      if (images == null) return;

      if (selectedImages.isNotEmpty) {
        setState(() {
          selectedImages = [...selectedImages, ...images];
        });
        return;
      }

      setState(() => selectedImages = images);

      widget.onSelectImage(selectedImages);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return selectedImages.isEmpty
        ? SizedBox(
            child: CustomTouchableCard(
              height: 200,
              onTap: pickImage,
              child: const Icon(
                Icons.add,
                size: 35,
                color: AppColors.grey,
              ),
            ),
          )
        : Expanded(
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: selectedImages.length < 6
                    ? selectedImages.length + 1
                    : selectedImages.length,
                itemBuilder: (context, index) {
                  if (index == selectedImages.length) {
                    // Last item → Custom Widget
                    return CustomTouchableCard(
                      height: 200,
                      onTap: pickImage,
                      child: const Icon(
                        Icons.add,
                        size: 35,
                        color: AppColors.grey,
                      ),
                    );
                  }
                  return CustomTouchableCard(
                    onTap: () {},
                    child: Image.file(
                      File(selectedImages[index].path),
                      fit: BoxFit.cover,
                      //     fit: BoxFit.cover),
                    ),
                  );
                }),
          );
  }
}
