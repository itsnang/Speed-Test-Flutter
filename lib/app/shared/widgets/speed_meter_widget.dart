import 'package:flutter/material.dart';
import 'package:speedtest_kh/app/shared/themes/color_theme.dart';
import 'package:speedtest_kh/app/shared/themes/theme.dart';
import 'package:speedtest_kh/app/shared/widgets/text_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedMeter extends StatelessWidget {
  const SpeedMeter({
    super.key,
    required this.currentSpeed,
  });

  final double currentSpeed;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 3000,
      axes: <RadialAxis>[
        RadialAxis(
          showTicks: false,
          labelOffset: 30,
          showLastLabel: true,
          maximum: 110,
          axisLabelStyle: GaugeTextStyle(color: context.disableColor),
          startAngle: 150,
          endAngle: 30,
          ranges: [
            GaugeRange(
              rangeOffset: -1,
              startValue: 0,
              endValue: 110,
              color: ColorTheme.grey700,
              startWidth: 20,
              endWidth: 20,
            ),
          ],
          showAxisLine: false,
          pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: currentSpeed,
              needleColor: context.primaryColor,
              knobStyle: KnobStyle(
                color: context.primaryColor,
                knobRadius: 0.09,
                borderWidth: 0.01,
                borderColor: context.primaryColor,
              ),
              needleEndWidth: 16.1,
              needleLength: 0.66,
              animationType: AnimationType.elasticOut,
            ),
            RangePointer(
              value: currentSpeed,
              width: 0.12,
              sizeUnit: GaugeSizeUnit.factor,
              color: context.primaryColor,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: TextWidget.custom(
                fontSize: 20,
                color: context.backgroundColor,
                '${currentSpeed.toStringAsFixed(2)} Mbps',
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}
