import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:skripsi/config/config.dart';
import 'package:skripsi/presentation/page/profile_page/component/component.dart';
import 'package:skripsi/utils/extension/extension.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cBackground,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderProfile(),
            20.0.height,
            const DeskripsiProfile(),
            20.0.height,
            const ButtonPenggunaanProfile(),
            20.0.height,
            Text(
              'App Version ${_packageInfo.version}',
              style: AppFont.regular.copyWith(
                color: AppColor.cGrey,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
