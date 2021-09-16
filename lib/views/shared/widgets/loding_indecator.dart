
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoadingIndecator extends StatelessWidget {
  const AppLoadingIndecator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 30.h,
      width: 30.h,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColors.primaryBlue),
      ),
    ));
  }
}
