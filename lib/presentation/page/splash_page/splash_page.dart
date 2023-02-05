import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/src/lottie_src.dart';
import 'package:skripsi/utils/extension/extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    context.goNamed('main_page');
  }

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          LottieString.splash,
        ),
        20.0.height,
        Text(
          'AUGMENTED REALITY\nPENGENALAN CANDI',
          style: AppFont.medium.copyWith(
            fontSize: 20.sp,
            height: 1.5,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cBackground,
      body: content(),
    );
  }
}
