import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';
import 'package:speedtest_kh/app/shared/widgets/button_widget.dart';
import 'package:speedtest_kh/app/shared/widgets/dialogs/dialog_containter_widget.dart';
import 'package:speedtest_kh/app/shared/widgets/text_widget.dart';
import 'package:speedtest_kh/constants/enums/text_enum.dart';

class DialogAlertWiget extends StatelessWidget {
  DialogAlertWiget({
    super.key,
    required this.lottieString,
    this.title,
    this.desc,
    this.closeButtonString = 'OK',
    this.onClosePressed,
    this.confirmButtonString = '',
    this.onConfirmPressed,
  });

  String? title;
  String? desc;
  String lottieString;
  String closeButtonString;
  VoidCallback? onClosePressed;
  String confirmButtonString;
  VoidCallback? onConfirmPressed;

  @override
  Widget build(BuildContext context) {
    desc ??= 'Error';

    Widget confirmButton = const SizedBox();
    Widget spacer = const SizedBox();

    final cancelButton = Expanded(
      child: ButtonWidget.round(
        closeButtonString,
        isBold: true,
        borderRadius: BasedDialogContainer.borderRadius,
        fontSize: TextSizeEnum.body,
        onPressed: () {
          Get.back();
          onClosePressed?.call();
        },
      ),
    );

    if (onConfirmPressed != null) {
      confirmButton = Expanded(
        child: ButtonWidget.round(
          confirmButtonString,
          isBold: true,
          borderRadius: BasedDialogContainer.borderRadius,
          fontSize: TextSizeEnum.body,
          onPressed: onConfirmPressed,
        ),
      );

      spacer = const SizedBox(width: 10);
    }

    return BasedDialogContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(lottieString, width: 30, height: 30),
          const SizedBox(height: 10),
          if (title != null)
            TextWidget.subtitle(title!,
                isBold: true,
                textAlign: TextAlign.center,
                color: context.secondaryColor),
          if (desc != null)
            TextWidget.body(desc!,
                textAlign: TextAlign.center, color: context.outlineColor),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cancelButton,
              spacer,
              confirmButton,
            ],
          ),
        ],
      ),
    );
  }
}
