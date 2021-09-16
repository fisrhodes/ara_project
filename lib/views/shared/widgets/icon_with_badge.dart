
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithBadge extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;
  final int notificationCount;

  const IconWithBadge({
    Key key,
    this.onTap,
    @required this.icon,
    this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            icon,
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xfffb0f5d4),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  notificationCount > 10
                      ? '$notificationCount'
                      : '0$notificationCount',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Color(0xfff13b440),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
