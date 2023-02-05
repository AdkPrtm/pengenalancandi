import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skripsi/config/config.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
  }) : super(key: key);

  Future<bool> downloadFile(String fileName) async {
    late File file;
    try {
      if (Platform.isAndroid) {
        var status = await Permission.storage.status;
        if (status != PermissionStatus.granted) {
          status = await Permission.storage.request();
        }
        if (status.isDenied) {
          Fluttertoast.showToast(
            msg: "Permission Storage Failed, please allow in setting.",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: AppColor.cGrey,
            textColor: Colors.white,
            fontSize: 14.0.sp,
          );
          return false;
        }
        if (status.isPermanentlyDenied) {
          Fluttertoast.showToast(
            msg: "Permission storage failed, please allow in setting.",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: AppColor.cGrey,
            textColor: Colors.white,
            fontSize: 14.0.sp,
          );
          return false;
        }
        if (status.isGranted) {
          const downloadsFolderPath = '/storage/emulated/0/Download';
          Directory dir = Directory(downloadsFolderPath);
          file = File('${dir.path}/$fileName');
          if (await file.exists()) {
            Fluttertoast.showToast(
              msg: "The file is available in the download/panduan.pdf folder, please delete it first.",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: AppColor.cGrey,
              textColor: Colors.white,
              fontSize: 14.0.sp,
            );
            return false;
          }
        }
      }
      ByteData byteData = await rootBundle.load('assets/pdf/$fileName');
      // await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      return true;
    } on FileSystemException {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColor.cBlueSelected,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onPressed: () async {
          bool result = await downloadFile('panduan.pdf');
          if (result) {
            Fluttertoast.showToast(
              msg: "Download successfully",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: AppColor.cGrey,
              textColor: Colors.white,
              fontSize: 14.0,
            );
          }
        },
        child: Text(
          "Download pdf file",
          style: AppFont.semiBold.copyWith(
            color: AppColor.cWhite,
          ),
        ),
      ),
    );
  }
}
