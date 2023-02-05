import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';

class DeskripsiProfile extends StatelessWidget {
  const DeskripsiProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimen.w16,
        vertical: AppDimen.h16,
      ),
      decoration: BoxDecoration(
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
      child: Text(
        '   Tujuan yang ingin dicapai adalah dapat membuat sebuah aplikasi augmented reality menggunakan metode marklerless berbasis Android untuk mendukung proses pembelajaran siswa SMA ITCI Penajam Paser Utara dengan menampilkan objek candi secara 3D sehingga memberikan ilustrasi atau bayangan mengenai material desain dari candi yang mencakup pemberian nilai tambah pula untuk buku-buku yang sudah ada.',
        style: AppFont.regular.copyWith(
          fontSize: 16.sp,
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
