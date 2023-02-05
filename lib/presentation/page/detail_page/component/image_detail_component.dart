import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/model/gambar_model.dart';
import 'package:skripsi/presentation/page/detail_page/bloc/detail_page_bloc.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({
    Key? key,
    required this.gambarCandi,
  }) : super(key: key);

  final List<GambarCandi> gambarCandi;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<DetailPageBloc, DetailPageState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: gambarCandi
                      .map((e) => SizedBox(
                            height: 250.h,
                            width: double.infinity,
                            child: Image.asset(
                              e.pathGambarCandi!,
                              fit: BoxFit.cover,
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      context.read<DetailPageBloc>().add(TapedTabbar(
                          indexImage: index,
                          indexTabbar:
                              (state as DetailPageInitial).indexTabbar));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: AppDimen.h10),
                  padding: EdgeInsets.all(AppDimen.h4),
                  constraints: BoxConstraints(minWidth: 20.h, minHeight: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.cGrey.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: gambarCandi.asMap().entries.map((entry) {
                      return AnimatedContainer(
                        width:
                            (state as DetailPageInitial).indexImage == entry.key
                                ? 16
                                : 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        // color: AppColor.cTextBlack,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: state.indexImage == entry.key
                              ? AppColor.cBlack
                              : AppColor.cBlack.withOpacity(0.5),
                        ),
                        duration: const Duration(milliseconds: 100),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: AppDimen.h10,
          left: AppDimen.w10,
          right: 0.0,
          child: AppBar(
            leading: IconButton(
              icon: Container(
                height: 70.h,
                width: 70.h,
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
    );
  }
}
