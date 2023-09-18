import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speedtest_kh/app/shared/widgets/dialogs/dialog_alert_image_widget.dart';
import 'package:speedtest_kh/app/shared/widgets/dialogs/dialog_alert_widget.dart';

class DialogWidget {
  DialogWidget._();

  static DialogAlertWiget error({
    String? title,
    String? desc,
    String okayButtonString = 'OK',
    VoidCallback? onOkayPressed,
  }) {
    return DialogAlertWiget(
      lottieString: 'assets/lotties/error.zip',
      title: title,
      desc: desc,
      closeButtonString: okayButtonString,
      onClosePressed: onOkayPressed,
    );
  }

  static void showError({
    String? title,
    String? desc,
    String okayButtonString = 'OK',
    VoidCallback? onOkayPressed,
  }) {
    Get.dialog(
      DialogAlertWiget(
        lottieString: 'assets/lotties/error.zip',
        title: title,
        desc: desc,
        closeButtonString: okayButtonString,
        onClosePressed: onOkayPressed,
      ),
    );
  }

  static DialogAlertWiget info({
    String? title,
    String? desc,
    String okayButtonString = 'OK',
    VoidCallback? onOkayPressed,
    String confirmButtonString = '',
    VoidCallback? onConfirmPressed,
  }) {
    return DialogAlertWiget(
      lottieString: 'assets/lotties/info.zip',
      title: title,
      desc: desc,
      closeButtonString: okayButtonString,
      onClosePressed: onOkayPressed,
      confirmButtonString: confirmButtonString,
      onConfirmPressed: onConfirmPressed,
    );
  }

  static DialogAlertImageWiget infoImage({
    String? title,
    String? desc,
    String? imageURL,
    String okayButtonString = 'OK',
    VoidCallback? onOkayPressed,
    String confirmButtonString = '',
    VoidCallback? onConfirmPressed,
  }) {
    return DialogAlertImageWiget(
      lottieString: 'assets/lotties/info.zip',
      title: title,
      desc: desc,
      imageURL: imageURL,
      closeButtonString: okayButtonString,
      onClosePressed: onOkayPressed,
      confirmButtonString: confirmButtonString,
      onConfirmPressed: onConfirmPressed,
    );
  }
}
