import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/src/img_src.dart';
import 'package:skripsi/utils/extension/extension.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 282.h),
      decoration: BoxDecoration(
        color: AppColor.cWhite,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          30.0.height,
          Stack(
            children: [
              Container(
                height: 160.h,
                width: 160.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImgString.profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 55.h,
                  width: 55.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImgString.unmul),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          12.0.height,
          Text(
            'ANDHIKA PRATAMA WIDIARTO',
            style: AppFont.medium.copyWith(fontSize: 16.sp),
          ),
          8.0.height,
          Text(
            'Teknik Informatika\nUniversitas Mulawarman',
            style: AppFont.light.copyWith(
              fontSize: 14.sp,
              color: AppColor.cGrey,
            ),
            textAlign: TextAlign.center,
          ),
          15.0.height,
        ],
      ),
    );
  }
}
