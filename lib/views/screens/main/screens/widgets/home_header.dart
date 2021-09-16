import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/services/api_services.dart';
import 'package:ara_vnext/logic/services/storage_services.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_screen.dart';

//Home Widget
class HomeHeader extends StatelessWidget {
  final String title;
  const HomeHeader({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: 48.h,
          left: 16.w,
          right: 16.w,
        ),
        height: 174.h,
        decoration: BoxDecoration(
          gradient: AppColors.blueGradient,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 28.h,
                  color: Colors.white,
                ),
                SizedBox(width: 10.w),
                Text(
                  'HOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                IconWithBadge(
                  icon: Icon(
                    Icons.notifications_none,
                    size: 28.h,
                    color: Colors.white,
                  ),
                  notificationCount: 02,
                  onTap: () {
                    sl<ApiServices>().loadHome();
                  },
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 17.h,
                  backgroundColor: Color(0xfffefd9ff),
                  child: Text(
                    '${sl<StorageServices>().user?.username[0].toUpperCase()} ${sl<StorageServices>().user?.username[sl<StorageServices>().user.username.length - 1].toUpperCase()}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xfff9f3ce8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title ?? '',
                    // softWrap: false,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 24.w,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Container(
                  width: 35.w,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
