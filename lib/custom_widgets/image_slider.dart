import 'dart:io';

import 'package:bir_bir/assets/app_colors.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.onFavoriteToggle,
    required this.isFavorite,
    required this.src,
    this.height = 200,
  });

  final List<File> src;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;
  final double height;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.src.length,
                  onPageChanged: (index) {
                    setState(() {
                      activePage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.file(
                      widget.src[index],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: widget.onFavoriteToggle,
                    icon: Icon(
                      Icons.favorite,
                      color: widget.isFavorite ? Colors.red : Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        ActiveDot(length: widget.src.length, activeIndex: activePage),
      ],
    );
  }
}

class ActiveDot extends StatefulWidget {
  const ActiveDot({super.key, this.activeIndex = 0, required this.length});

  final int activeIndex;
  final int length;

  @override
  State<ActiveDot> createState() => _ActiveDotState();
}

class _ActiveDotState extends State<ActiveDot> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Nuqtalarni markazga joylashtirish
      children: List.generate(widget.length, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.activeIndex == index
                  ? AppColors.black
                  : AppColors.lightGrey),
        );
      }),
    );
  }
}
