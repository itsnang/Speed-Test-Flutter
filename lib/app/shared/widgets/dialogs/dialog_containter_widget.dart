import 'package:flutter/material.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';

class BasedDialogContainer extends StatelessWidget {
  const BasedDialogContainer({super.key, required this.child});

  static const double borderRadius = 12;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        width: 350,
        decoration: BoxDecoration(
          color: context.backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
