import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';
import 'package:speedtest_kh/presentation/speed_test/speed_test_page.dart';

class InitializedApp extends StatelessWidget {
  const InitializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speed Test',
      theme: PtTheme.lightTheme,
      home: SpeedTestPage(),
    );
  }
}
