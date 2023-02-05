import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/data/model/candi_model.dart';
import 'package:skripsi/presentation/page/ar_page/ar_page.dart';
import 'package:skripsi/presentation/page/detail_page/bloc/detail_page_bloc.dart';
import 'package:skripsi/presentation/page/detail_page/detail_page.dart';
import 'package:skripsi/presentation/page/home_page/home_page.dart';
import 'package:skripsi/presentation/page/main_page/main_page.dart';
import 'package:skripsi/presentation/page/panduan_page/panduan_page.dart';
import 'package:skripsi/presentation/page/profile_page/profile_page.dart';
import 'package:skripsi/presentation/page/splash_page/splash_page.dart';
import 'package:skripsi/utils/helper/data_helper.dart';
import 'presentation/page/main_page/bloc/main_page_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.cBlueSelected,
    ),
  );
  runApp(const MyApp());
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash_page',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/main_page',
      name: 'main_page',
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
            path: 'detail_page',
            name: 'detail_page',
            builder: (context, state) {
              Object? object = state.extra;
              if (object != null && object is CandiModel) {
                return DetailPage(candiModel: object);
              } else {
                return DetailPage(candiModel: DataHelper.listCandi[0]);
              }
            },
            routes: [
              GoRoute(
                path: 'AR_Detail_page',
                name: 'AR_Detail_page',
                builder: (context, state) => const ARPage(),
              ),
            ]),
        GoRoute(
          path: 'panduan_page',
          name: 'panduan_page',
          builder: (context, state) => const PanduanPage(),
        ),
        GoRoute(
          path: 'AR_page',
          name: 'AR_page',
          builder: (context, state) => const ARPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/home_page',
      name: 'home_page',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/information_page',
      name: 'information_page',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
  initialLocation: '/',
  routerNeglect: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => MainPageBloc()),
            BlocProvider(create: (_) => DetailPageBloc()),
          ],
          child: MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
          ),
        );
      },
    );
  }
}
