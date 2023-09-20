import 'package:flutter/material.dart';
import 'package:speedtest_kh/app/shared/widgets/text_widget.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TextWidget.title('Success!'),
      )),
    );
  }
}
