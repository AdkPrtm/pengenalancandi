import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';

class ListCandiCard extends StatelessWidget {
  const ListCandiCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimen.w16),
      child: Text(
        'Pilihan Candi',
        style: AppFont.semiBold.copyWith(
          fontSize: 17.sp,
        ),
      ),
    );
  }
}
