import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:speedtest_kh/app/shared/themes/color_theme.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';
import 'package:speedtest_kh/app/shared/widgets/button_widget.dart';
import 'package:speedtest_kh/app/shared/widgets/speed_meter_widget.dart';
import 'package:speedtest_kh/app/shared/widgets/text_widget.dart';
import 'package:speedtest_kh/presentation/controller/speed_test_controller.dart';

class SpeedTestPage extends StatelessWidget {
  SpeedTestPage({super.key});
  SpeedTestController controller = Get.put(SpeedTestController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpeedTestController>(
      builder: (context) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 52),
            children: [
              _buildSpeedResult(controller),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget.body(
                  controller.status.toUpperCase(),
                  color: Get.context!.backgroundColor,
                  textAlign: TextAlign.center,
                ),
              ),
              SpeedMeter(currentSpeed: controller.currentSpeed),
              ButtonWidget.round(
                controller.isDisabled ? 'Testing...' : 'Test Speed',
                icon: controller.isDisabled
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Get.context!.backgroundColor,
                          strokeWidth: 2,
                        ),
                      )
                    : null,
                isFull: true,
                isDisabled: controller.isDisabled,
                onPressed: controller.getSpeed,
              ),
              _buildDetail(controller),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetail(SpeedTestController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _itemContainer(
                icon: HeroIcons.devicePhoneMobile,
                title: 'Ping',
                subtitle: controller.ping.toString(),
                iconColor: Get.context!.secondaryColor,
                backgroundColor: Get.context!.secondaryColor.withOpacity(0.2),
              ),
              _itemContainer(
                subtitle: controller.connectionType == ''
                    ? 'Unknow'
                    : controller.connectionType.toUpperCase(),
                icon: HeroIcons.wifi,
                title: 'Connection',
                iconColor: Get.context!.tertiaryColor,
                backgroundColor: Get.context!.tertiaryColor.withOpacity(0.2),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _itemContainer(
            icon: HeroIcons.userCircle,
            title: 'ISP',
            subtitle:
                controller.isp == '' ? 'Unknow' : controller.isp.toUpperCase(),
            iconColor: Get.context!.primaryColor,
            backgroundColor: Get.context!.primaryColor.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _itemContainer({
    required HeroIcons icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: HeroIcon(
            icon,
            size: 28,
            color: iconColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.body(title,
                isBold: true, color: Get.context!.outlineColor),
            TextWidget.subtitle(subtitle, color: Get.context!.outlineColor),
          ],
        ),
      ],
    );
  }

  Widget _buildSpeedResult(SpeedTestController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Get.context!.primaryLightColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  HeroIcon(
                    HeroIcons.arrowDownCircle,
                    size: 26,
                    style: HeroIconStyle.solid,
                    color: Get.context!.secondaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextWidget.subtitle('Download',
                      isBold: true, color: Get.context!.outlineColor),
                ],
              ),
              TextWidget.subtitle(
                  '${controller.downloadSpeed.toStringAsFixed(2)} Mbps',
                  color: Get.context!.outlineColor),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  HeroIcon(
                    HeroIcons.arrowUpCircle,
                    size: 26,
                    style: HeroIconStyle.solid,
                    color: Get.context!.primaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextWidget.subtitle('Upload',
                      isBold: true, color: Get.context!.outlineColor),
                ],
              ),
              TextWidget.subtitle(
                '${controller.uploadSpeed.toStringAsFixed(2)} Mbps',
                color: Get.context!.outlineColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
