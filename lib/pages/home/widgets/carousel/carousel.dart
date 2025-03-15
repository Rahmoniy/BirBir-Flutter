import 'package:bir_bir/pages/home/widgets/carousel/carousel_item.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _InfiniteCarouselState();
}

class _InfiniteCarouselState extends State<Carousel> {
  final PageController _pageController = PageController(
      initialPage: 1000, viewportFraction: 0.8); // Start at a middle index
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'dd'];

  @override
  Widget build(BuildContext context) {
    print('%%%%, ${1 % 7}');
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final actualIndex = index % items.length; // Loop back the index
          return CarouselItem();
        },
      ),
    );
  }
}

// Center(
//             child: Container(
//               width: 300,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   items[actualIndex],
//                   style: const TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//           );