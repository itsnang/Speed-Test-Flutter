import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';
import 'package:speedtest_kh/presentation/face_%20detect%20_page.dart';
import 'package:speedtest_kh/presentation/history_page.dart';
import 'package:speedtest_kh/presentation/speed_test/speed_test_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class InitializedApp extends StatelessWidget {
  const InitializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speed Test',
      theme: PtTheme.lightTheme,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedIndex = 0;
  static final _widgetOptions = <Widget>[
    SpeedTestPage(),
    FaceDetectPage(),
    HistoryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: context.disableColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: context.primaryLightColor,
                hoverColor: context.primaryLightColor,
                gap: 4,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: context.primaryLightColor,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Iconsax.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Iconsax.profile_circle,
                    text: 'Face',
                  ),
                  GButton(
                    icon: Iconsax.search_favorite,
                    text: 'History',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              )),
        ),
      ),
    );
  }
}
