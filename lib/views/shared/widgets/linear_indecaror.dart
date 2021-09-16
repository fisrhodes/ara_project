import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//Global Widget
class LinearIndecator extends StatelessWidget {
  final num value, minValue, maxValue;
  final String label;
  LinearIndecator({
    Key key,
    @required this.maxValue,
    @required this.minValue,
    @required this.value,
    @required this.label,
  }) : super(key: key);

  final valueStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12.sp,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 70.h),
      child: Stack(
        children: [
          SliderTheme(
            data: SliderThemeData(
              activeTickMarkColor: Colors.white,
              thumbColor: Colors.orange,
              inactiveTrackColor: Colors.orange.shade100,
              activeTrackColor: Colors.orange,
              // minThumbSeparation: 1,
              trackHeight: 10,
              minThumbSeparation: 10,
              thumbShape: CustomShape(),
            ),
            child: AbsorbPointer(
              child: Slider(
                max: maxValue.toDouble(),
                min: minValue.toDouble(),
                value: value.toDouble(),
                onChanged: (_) {
                  return null;
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$minValue',
                  style: valueStyle,
                ),
                Text(
                  '$maxValue',
                  style: valueStyle,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$value',
                  style: TextStyle(fontSize: 17.sp),
                ),
                Text(
                  'excution',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.darkGreyBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Global Widget
class CustomShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(20);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: 0,
      end: 8,
    );
    final Tween<double> radiusTween2 = Tween<double>(
      begin: 0,
      end: 13,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    canvas.drawCircle(
      center,
      radiusTween2.evaluate(enableAnimation),
      Paint()..color = Colors.white,
    );
    canvas.drawCircle(
      center,
      radiusTween.evaluate(enableAnimation),
      Paint()..color = colorTween.evaluate(enableAnimation),
    );
  }
}
