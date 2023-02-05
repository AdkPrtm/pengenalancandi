import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/presentation/page/home_page/home_page.dart';
import 'package:skripsi/presentation/page/main_page/bloc/main_page_bloc.dart';
import 'package:skripsi/presentation/page/main_page/component/component.dart';
import 'package:skripsi/presentation/page/profile_page/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: buildContent((state as MainPageInitial).indexButtomNavbar),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.cBlueSelected,
            child: const Icon(
              Icons.camera_alt_rounded,
            ),
            onPressed: () => context.goNamed('AR_page'),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Navbar(currenIndex: (state).indexButtomNavbar),
        );
      },
    );
  }
}
