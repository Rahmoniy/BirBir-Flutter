import 'dart:io';

import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/custom_widgets/custom_touchable_card.dart';
import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/pages/category_detail/category_detail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List<File> imgSrc = [
  File(
      '/Users/rahmoniy/Library/Developer/CoreSimulator/Devices/BD2A2D1E-1983-4052-B0BF-E38179E74A6F/data/Containers/Data/Application/24ADBCEB-CFBC-4D89-87AA-E03BB4418E33/tmp/image_picker_EA0DEBB5-57F4-43C2-B3E9-26E3C84142A2-25142-000000A5046DE515.jpg'),
  File(
      '/Users/rahmoniy/Library/Developer/CoreSimulator/Devices/BD2A2D1E-1983-4052-B0BF-E38179E74A6F/data/Containers/Data/Application/24ADBCEB-CFBC-4D89-87AA-E03BB4418E33/tmp/image_picker_477C5405-5FC8-45D9-A4CE-1B6CE1037188-25142-000000A5038D065E.jpg'),
  File(
      '/Users/rahmoniy/Library/Developer/CoreSimulator/Devices/BD2A2D1E-1983-4052-B0BF-E38179E74A6F/data/Containers/Data/Application/24ADBCEB-CFBC-4D89-87AA-E03BB4418E33/tmp/image_picker_1AF60119-2BD2-4DEE-AE85-38974776E697-25142-000000A503CB6B06.jpg'),
];

bool isFavorite = false;

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _Main(
                imageSrc: product.images,
                price: product.price,
                name: product.name,
              ),
              _Characteristics(),
              _Description(),
              _ShowMap(),
            ],
          ),
        ));
  }
}

class _Main extends StatelessWidget {
  const _Main(
      {super.key,
      required this.imageSrc,
      required this.name,
      required this.price});

  final List<File> imageSrc;
  final num price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageSlider(
            onFavoriteToggle: () {},
            isFavorite: isFavorite,
            src: imageSrc,
            height: 350,
          ),
          Text(
            '$price sum',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTouchableCard(
            padding: const EdgeInsets.symmetric(vertical: 5),
            onTap: () {},
            width: 130,
            child: const Center(
              child: Text('Срочно. Торг.'),
            ),
          )
        ],
      ),
    );
  }
}

class _Characteristics extends StatelessWidget {
  const _Characteristics({super.key});

  @override
  Widget build(BuildContext context) {
    return _TitleCard(title: 'Характеристики', widget: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Состояние',
            style: TextStyle(color: AppColors.grey, fontSize: 18),
          ),
          SizedBox(
            width: 150,
            child: Text(
              'Б/у (хорошее, отличное)',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Производитель',
            style: TextStyle(color: AppColors.grey, fontSize: 18),
          ),
          SizedBox(
            width: 150,
            child: Text(
              'Другая марка',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

class _Description extends StatelessWidget {
  const _Description({super.key});

  @override
  Widget build(BuildContext context) {
    return _TitleCard(title: 'Описание', widget: [
      Text(
        'Другая марка',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ]);
  }
}

class _ShowMap extends StatelessWidget {
  const _ShowMap({super.key});

  final double latitude = 41.2995; // Toshkentning kengligi
  final double longitude = 69.2401; // Toshkentning uzunligi

  Future<void> _openMap() async {
    final Uri googleMapUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Xarita ochilmadi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return _TitleCard(title: 'Место сделки', widget: [
      GestureDetector(
        onTap: _openMap,
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              // Google Maps static API dan xarita rasmi
              Image.network(
                "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=300x500&markers=color:red%7C$latitude,$longitude&key=AIzaSyC5qFGMmo59mSPMyLLt--0ANEnGGkr14TY",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              // Pin rasmi
              const Center(
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard({super.key, required this.title, required this.widget});

  final String title;
  final List<Widget> widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            ...widget,
          ],
        ));
  }
}
