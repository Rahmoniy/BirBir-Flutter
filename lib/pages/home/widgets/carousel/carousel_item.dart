import 'package:bir_bir/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 3, 6, 3),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        maxRadius: 10,
                        child: Icon(
                          color: Colors.white,
                          Icons.percent,
                          size: 13,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        'Выгода до 50%',
                        color: Colors.blueGrey,
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: CustomText(
                  'Подборка \niPhone',
                  color: const Color.fromARGB(255, 51, 51, 51),
                  isBold: true,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0, // Stick to the right
            top: 0,
            child: Image.network(
              'https://cdn0.it4profit.com/s3size/rt:fill/w:900/h:900/g:no/el:1/f:webp/plain/s3://cms/product/3a/1e/3a1ef89dbd056392005736bc806f2e9b/240911100040721473.webp',
              width: 100,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
