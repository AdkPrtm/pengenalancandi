import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';

class BoxPanduanWidget extends StatelessWidget {
  const BoxPanduanWidget({
    Key? key,
    required this.textPanduan,
    required this.numberStep,
    required this.heightContainer,
    this.isLast = false,
    this.isFirst = false,
  }) : super(key: key);

  final String textPanduan;
  final String numberStep;
  final double heightContainer;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightContainer,
      margin: EdgeInsets.only(top: isFirst ? AppDimen.h16 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: AppDimen.h5),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.cWhite,
                  border: Border.all(color: AppColor.cBlueSelected),
                ),
                child: Center(
                  child: Text(numberStep),
                ),
              ),
              isLast
                  ? Expanded(
                      child: Container(
                        height: double.infinity,
                        margin: EdgeInsets.only(
                          left: 30.w,
                          right: 30.w,
                          top: 5.h,
                        ),
                        child: const SizedBox(),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        height: double.infinity,
                        margin: EdgeInsets.only(
                          left: 30.w,
                          right: 30.w,
                          top: 5.h,
                        ),
                        child: VerticalDivider(
                          width: 2.w,
                          thickness: 2,
                          color: AppColor.cBlue,
                        ),
                      ),
                    ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: AppDimen.h5, right: AppDimen.w16, bottom: AppDimen.h8),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: double.infinity,
                  minWidth: double.infinity,
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimen.w10, vertical: AppDimen.h6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.cWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(textPanduan),
                    isFirst
                        ? const SizedBox()
                        : Divider(
                            height: 20.h,
                            thickness: 1,
                            color: AppColor.cGrey,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
