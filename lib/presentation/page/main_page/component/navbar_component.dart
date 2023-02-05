import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skripsi/config/theme/app_color.dart';
import 'package:skripsi/data/src/svg_src.dart';
import 'package:skripsi/presentation/page/main_page/bloc/main_page_bloc.dart';
import 'package:skripsi/utils/extension/double_extension.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
    this.currenIndex = 0,
  }) : super(key: key);

  final int currenIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                context
                    .read<MainPageBloc>()
                    .add(PageTapped(indexButtomNavbar: 0));
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SvgPicture.asset(
                  SvgString.home,
                  width: 40.h,
                  height: 40.h,
                  color: currenIndex == 0
                      ? AppColor.cBlueSelected
                      : AppColor.cGrey,
                ),
              ),
            ),
            12.0.width,
            TextButton(
              onPressed: () {
                context
                    .read<MainPageBloc>()
                    .add(PageTapped(indexButtomNavbar: 1));
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SvgPicture.asset(
                  SvgString.informasi,
                  width: 40.h,
                  height: 40.h,
                  color: currenIndex == 1
                      ? AppColor.cBlueSelected
                      : AppColor.cGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
