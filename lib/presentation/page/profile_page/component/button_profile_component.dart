import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';

class ButtonPenggunaanProfile extends StatelessWidget {
  const ButtonPenggunaanProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      height: 50.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColor.cBlueSelected,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onPressed: () {
          context.goNamed('panduan_page');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Panduan Pengunaan",
              style: AppFont.semiBold.copyWith(
                color: AppColor.cWhite,
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColor.cWhite,
            )
          ],
        ),
      ),
    );
  }
}
