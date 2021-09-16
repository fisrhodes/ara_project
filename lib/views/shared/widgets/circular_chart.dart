
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularChart extends StatelessWidget {
  final int value;

  const CircularChart({Key key, @required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          annotations: [
            GaugeAnnotation(
              widget: Text(
                '$value %',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: 0,
          radiusFactor: 0.7,
          canScaleToFit: true,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            // color: const Color.fromARGB(30, 0, 169, 181),
            color: Colors.grey.shade300,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.startCurve,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: value?.toDouble() ?? 0,
              width: 0.2,
              color: AppColors.primaryBlue,
              sizeUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.bothCurve,
            )
          ],
        ),
      ],
    );
  }
}
