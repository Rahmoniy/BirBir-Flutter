import 'dart:io';

import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:bir_bir/assets/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SelectImages extends StatefulWidget {
  const SelectImages({super.key, required this.onSelectImage});

  final Function(List<XFile>) onSelectImage;

  @override
  State<SelectImages> createState() => _SelectImagesState();
}

class _SelectImagesState extends State<SelectImages> {
  List<XFile> selectedImages = [];

  Future<void> pickImage() async {
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage(limit: 6);

      if (selectedImages.isNotEmpty) {
        setState(() {
          selectedImages = [...selectedImages, ...images];
        });
        return;
      }

      setState(() => selectedImages = images);

      widget.onSelectImage(selectedImages);
    } on PlatformException catch (e) {
      // print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return selectedImages.isEmpty
        ? SizedBox(
            child: AppTouchableCard(
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
                    return AppTouchableCard(
                      height: 200,
                      onTap: pickImage,
                      child: const Icon(
                        Icons.add,
                        size: 35,
                        color: AppColors.grey,
                      ),
                    );
                  }
                  return AppTouchableCard(
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
