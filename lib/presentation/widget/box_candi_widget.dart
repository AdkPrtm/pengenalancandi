import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/model/model.dart';

class BoxCandiWidget extends StatelessWidget {
  const BoxCandiWidget({
    Key? key,
    required this.candiModel,
  }) : super(key: key);
  final CandiModel candiModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('detail_page', extra: candiModel),
      child: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
        constraints: BoxConstraints(minHeight: 92.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.cWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 83.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.cBlue,
                image: DecorationImage(
                  image:
                      AssetImage(candiModel.gambarCandi![0].pathGambarCandi!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    candiModel.namaCandi!,
                    style: AppFont.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Divider(
                    height: 20.h,
                    thickness: 1,
                    color: AppColor.cGrey,
                  ),
                  Text(
                    candiModel.lokasiCandi!,
                    style: AppFont.regular.copyWith(
                      fontSize: 12.sp,
                      color: AppColor.cGrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
