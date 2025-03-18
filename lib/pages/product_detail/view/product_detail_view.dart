import 'dart:io';
import 'package:bir_bir/app_widgets/app_widgets.dart';
import 'package:bir_bir/assets/app_colors.dart';
import 'package:bir_bir/models/product_model.dart';
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
              const _Characteristics(),
              const _Description(),
              const _ShowMap(),
            ],
          ),
        ));
  }
}

class _Main extends StatelessWidget {
  const _Main(
      {required this.imageSrc, required this.name, required this.price});

  final List<File> imageSrc;
  final num price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageSlider(
            onFavoriteToggle: () {},
            isFavorite: isFavorite,
            src: imageSrc,
            height: 350,
          ),
          Text(
            '$price sum',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          AppTouchableCard(
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
  const _Characteristics();

  @override
  Widget build(BuildContext context) {
    return _TitleCard(
      title: 'Характеристики',
      children: [
        _buildRow('Состояние', 'Б/у (хорошее, отличное)'),
        const SizedBox(height: 15),
        _buildRow('Производитель', 'Другая марка'),
      ],
    );
  }

  static Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.grey, fontSize: 18),
        ),
        SizedBox(
          width: 150,
          child: Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const _TitleCard(title: 'Описание', children: [
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
  const _ShowMap();

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
    return _TitleCard(title: 'Место сделки', children: [
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
  const _TitleCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            ...children,
          ],
        ));
  }
}
