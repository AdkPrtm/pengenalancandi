import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/presentation/page/detail_page/bloc/detail_page_bloc.dart';

class TabBarDetail extends StatelessWidget {
  const TabBarDetail(
      {Key? key, required TabController tabController, required this.myTabs})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<Widget> myTabs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailPageBloc, DetailPageState>(
      builder: (context, state) {
        return TabBar(
          controller: _tabController,
          labelColor: AppColor.cBlueSelected,
          unselectedLabelColor: AppColor.cGrey,
          labelStyle: AppFont.semiBold.copyWith(
            fontSize: 14.sp,
            letterSpacing: 0.7,
          ),
          unselectedLabelStyle: AppFont.semiBold.copyWith(
            fontSize: 14.sp,
            letterSpacing: 0.7,
          ),
          indicatorColor: AppColor.cBlueSelected,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
          tabs: myTabs,
          onTap: ((value) {
            context.read<DetailPageBloc>().add(TapedTabbar(
                indexTabbar: value,
                indexImage: (state as DetailPageInitial).indexImage));
          }),
        );
      },
    );
  }
}
