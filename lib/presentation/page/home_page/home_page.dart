import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/src/img_src.dart';
import 'package:skripsi/presentation/page/home_page/component/component.dart';
import 'package:skripsi/presentation/widget/widget.dart';
import 'package:skripsi/utils/extension/extension.dart';
import 'package:skripsi/utils/helper/helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengenalan Candi',
          style: AppFont.medium.copyWith(
            fontSize: 18.sp,
            color: AppColor.cBackground,
          ),
        ),
        backgroundColor: AppColor.cBlue,
      ),
      body: ListView(
        children: [
          const ImageHome(pathImageCandi: ImgString.borobudur1),
          const ListCandiCard(),
          Column(
            children: DataHelper.listCandi
                .map<Widget>(
                  (dataCandi) => BoxCandiWidget(
                    candiModel: dataCandi,
                  ),
                )
                .toList(),
          ),
          40.0.height,
        ],
      ),
    );
  }
}
