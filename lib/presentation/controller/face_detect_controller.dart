import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedtest_kh/app/shared/widgets/dialogs/dialog_alert_widget.dart';
import 'package:speedtest_kh/app/shared/widgets/dialogs/dialog_widget.dart';
import 'package:speedtest_kh/presentation/sucess_page.dart';

class FaceDetectController extends GetxController {
  File? image;
  ImagePicker? _imagePicker;
  late Widget widget;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  final _cameraLensDirection = CameraLensDirection.front;

  @override
  void onInit() {
    _imagePicker = ImagePicker();

    super.onInit();
  }

  @override
  void onClose() {
    _canProcess = false;
    _faceDetector.close();
    super.onClose();
  }

  Future<void> processImage(InputImage inputImage) async {
    final faces = await _faceDetector.processImage(inputImage);
    if (faces.isEmpty) {
      Get.dialog(
        DialogWidget.info(
          title: 'Conformation',
          desc:
              'Please take a picture of yourself so that we can verify your identity.',
          onOkayPressed: () => Get.back(),
        ),
      );
    } else {
      Get.dialog(
        DialogAlertWiget(
          lottieString: 'assets/lotties/success.zip',
          title: 'Success',
          desc: "We're ready for your next step.",
        ),
      );
    }
  }

  Future getImage(ImageSource source) async {
    image = null;
    update();
    final pickedFile = await _imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      _processFile(pickedFile.path);
    }
  }

  Future _processFile(String path) async {
    image = File(path);
    update();
    final inputImage = InputImage.fromFilePath(path);
    await processImage(inputImage);
  }
}
