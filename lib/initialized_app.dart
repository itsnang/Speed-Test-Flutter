import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';

class InitializedApp extends StatelessWidget {
  const InitializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prutteka',
      theme: PtTheme.lightTheme,
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
