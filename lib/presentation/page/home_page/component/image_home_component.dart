import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/utils/helper/data_helper.dart';

class ImageHome extends StatelessWidget {
  const ImageHome({
    Key? key,
    required this.pathImageCandi,
  }) : super(key: key);

  final String pathImageCandi;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: DataHelper.gambarCandiRandom
          .map(
            (e) => Container(
              height: 139.h,
              margin: EdgeInsets.symmetric(vertical: AppDimen.w16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(e.pathGambarCandi!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
    );
  }
}
