import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/model/candi_model.dart';
import 'package:skripsi/data/src/img_src.dart';
import 'package:skripsi/utils/extension/extension.dart';
import 'package:url_launcher/url_launcher.dart';

class NamaCandi extends StatelessWidget {
  const NamaCandi({
    Key? key,
    required this.candiModel,
  }) : super(key: key);

  final CandiModel candiModel;

  Future<void> _launchUrl(String coordinate) async {
    String url =
        'https://www.google.com/maps/@?api=1&map_action=map&center=$coordinate&basemap=satellite&zoom=19';
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimen.w16,
        right: AppDimen.w16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            candiModel.namaCandi!,
            style: AppFont.semiBold.copyWith(
              fontSize: 18.sp,
            ),
          ),
          6.0.height,
          GestureDetector(
            onTap: () => _launchUrl(candiModel.geoCandi!),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    candiModel.lokasiCandi!,
                    style: AppFont.light.copyWith(
                      fontSize: 12.sp,
                      color: AppColor.cGrey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Image(
                  image: const AssetImage(ImgString.map),
                  width: 35.h,
                  height: 35.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
