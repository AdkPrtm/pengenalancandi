import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/src/img_src.dart';
import 'package:skripsi/presentation/page/panduan_page/component/component.dart';
import 'package:skripsi/presentation/widget/widget.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panduan Penggunaan',
          style: AppFont.regular.copyWith(
            fontSize: 18.sp,
            color: AppColor.cWhite,
          ),
        ),
        backgroundColor: AppColor.cBlue,
      ),
      body: ListView(
        children: const [
          BoxPanduanWidget(
            numberStep: '1',
            textPanduan:
                'Buka Aplikasi AR Candi dan akan muncul beberapa menu seperti Tombol Kamera, Halaman Menu Detail Candi, Panduan Penggunaan dan juga Profile Pembuat Aplikasi',
            heightContainer: 120,
            isFirst: true,
          ),
          BoxPanduanWidget(
            numberStep: '2',
            textPanduan:
                'Buka Menu Kamera AR dengan gambar seperti di bawah ini',
            heightContainer: 150,
            withImage: true,
            imgSrc: ImgString.panduankamera,
          ),
          BoxPanduanWidget(
            numberStep: '3',
            textPanduan:
                'Arahkan kamera seperti contoh gambar dibawah ini ke Image Target yang telah disiapkan. \n\nNote : jika belum ada bisa untuk download file pada halaman dibawah.',
            heightContainer: 230,
            withImage: true,
            imgSrc: ImgString.panduanscan,
            heightImage: 100,
          ),
          BoxPanduanWidget(
            numberStep: '4',
            textPanduan:
                'Aplikasi AR Candi ini akan memproses dan menampilkan beberapa informasi mengenai candi',
            heightContainer: 200,
            isLast: true,
            withImage: true,
            imgSrc: ImgString.panduanscan,
            heightImage: 100,
          ),
          DownloadButton(),
        ],
      ),
    );
  }
}
