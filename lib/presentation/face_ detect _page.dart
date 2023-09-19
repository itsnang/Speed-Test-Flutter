import 'package:flutter/material.dart';
import 'package:speedtest_kh/app/shared/widgets/text_widget.dart';

class FaceDetectPage extends StatelessWidget {
  const FaceDetectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TextWidget('face'),
      )),
    );
  }
}
