import 'dart:async';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speed_checker_plugin/speed_checker_plugin.dart';

class SpeedTestController extends GetxController {
  bool isDisabled = false;

  String status = '';
  int ping = 0;
  String server = '';
  String connectionType = '';
  double currentSpeed = 0;
  int percent = 0;
  double downloadSpeed = 0;
  double uploadSpeed = 0;
  String ip = '';
  String isp = '';
  final plugin = SpeedCheckerPlugin();
  late StreamSubscription<SpeedTestResult> subscription;

  Future<void> getIp() async {
    final value = await plugin.getIpInfo();

    ip = value['ip'] ?? '';
    isp = value['isp'] ?? 'Unknow';
    update();
  }

  Future<void> getSpeed() async {
    isDisabled = true;
    update();

    final locationPermission = await handleLocationPer();

    if (locationPermission.isDenied) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Please turn on location permission to continue',
        title: 'Location Permission Error',
      ));
      return;
    }

    plugin.startSpeedTest();
    subscription = plugin.speedTestResultStream.listen(
      (event) {
        status = event.status;
        ping = event.ping;
        percent = event.percent;
        currentSpeed = event.currentSpeed;
        downloadSpeed = event.downloadSpeed;
        uploadSpeed = event.uploadSpeed;
        server = event.server;
        connectionType = event.connectionType;

        if (event.status == 'Speed test started') {
          isDisabled = true;
          update();
        }

        if (event.status == 'Speed test finished') {
          isDisabled = false;
          update();
        }

        update();
      },
      onDone: () {
        subscription.cancel();
        isDisabled = false;
        update();
      },
      onError: (error) {
        status = error.toString();
        subscription.cancel();
        isDisabled = false;
        update();
      },
    );
  }

  Future<PermissionStatus> handleLocationPer() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      status = await Permission.location.request();
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    return status;
  }

  Future<void> initPermisstion() async {
    await handleLocationPer();
  }

  @override
  void onInit() {
    initPermisstion();
    super.onInit();
  }
}
