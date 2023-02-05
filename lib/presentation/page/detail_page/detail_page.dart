import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/model/candi_model.dart';
import 'package:skripsi/presentation/page/detail_page/bloc/detail_page_bloc.dart';
import 'package:skripsi/presentation/page/detail_page/component/component.dart';
import 'package:skripsi/utils/extension/extension.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.candiModel});

  final CandiModel candiModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    context
        .read<DetailPageBloc>()
        .add(const TapedTabbar(indexImage: 0, indexTabbar: 0));
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> myTabs = [
    const Tab(text: 'Riwayat'),
    const Tab(text: 'Relief'),
    const Tab(text: 'Tahun'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          ListView(
            children: [
              ImageDetail(gambarCandi: widget.candiModel.gambarCandi!),
              16.0.height,
              NamaCandi(candiModel: widget.candiModel),
              TabBarDetail(tabController: _tabController, myTabs: myTabs),
              BlocBuilder<DetailPageBloc, DetailPageState>(
                builder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: [
                      //NANTI DIPISAH TIAP TAB YAA DIBUATKAN KOMPONEN SENDIRI!!
                      Text(
                        widget.candiModel.riwayatCandi!,
                        style: AppFont.regular.copyWith(
                          fontSize: 16.sp,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Column(
                        children: widget.candiModel.reliefCandi != null
                            ? widget.candiModel.reliefCandi!
                                .map(
                                  (dataCandi) => Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    child:
                                        Image.asset(dataCandi.pathReliefCandi!),
                                  ),
                                )
                                .toList()
                            : [const Text('Tidak ada data!')],
                      ),
                      Center(child: Text(widget.candiModel.tahunCandi!))
                    ][(state as DetailPageInitial).indexTabbar],
                  );
                },
              ),
              50.0.height
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.cBlueSelected,
        child: const Icon(
          Icons.camera_alt_rounded,
        ),
        onPressed: () => context.goNamed('AR_Detail_page'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
