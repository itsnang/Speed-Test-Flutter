import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';
import 'package:speedtest_kh/app/shared/widgets/button_widget.dart';
import 'package:speedtest_kh/presentation/controller/face_detect_controller.dart';
import 'package:speedtest_kh/presentation/controller/speed_test_controller.dart';

class FaceDetectPage extends StatelessWidget {
  FaceDetectPage({super.key});
  FaceDetectController controller = Get.put(FaceDetectController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaceDetectController>(
      init: FaceDetectController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: _imageHolder(context, controller),
          )),
        );
      },
    );
  }
}

Widget _imageHolder(BuildContext context, FaceDetectController controller) {
  return Column(
    children: [
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: 400,
            width: 400,
            color: context.disableColor,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: controller.image != null
                  ? Image.file(controller.image!)
                  : const HeroIcon(HeroIcons.photo),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      ButtonWidget.round('Choose image',
          icon: HeroIcon(HeroIcons.photo, color: context.backgroundColor),
          isFull: true,
          onPressed: () => controller.getImage(ImageSource.gallery)),
      const SizedBox(
        height: 16,
      ),
      ButtonWidget.round(
        icon: HeroIcon(HeroIcons.camera, color: context.backgroundColor),
        backgroundColor: context.primaryColor,
        'Take a picture',
        onPressed: () => controller.getImage(ImageSource.camera),
        isFull: true,
      )
    ],
  );
}
