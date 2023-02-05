import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_unity/flutter_unity.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';

class ARPage extends StatelessWidget {
  const ARPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const UnityView(),
          Positioned(
            top: AppDimen.h10,
            left: AppDimen.w10,
            right: 0.0,
            child: AppBar(
              leading: IconButton(
                icon: Container(
                  height: 1000.h,
                  width: 1000.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.cGrey.withOpacity(0.3),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColor.cWhite,
                    ),
                  ),
                ),
                onPressed: () => context.pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
