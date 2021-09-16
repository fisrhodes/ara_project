import 'package:ara_vnext/logic/models/home_data.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Home Widget
class ObjectiveCard extends StatelessWidget {
  final Objective objective;

  const ObjectiveCard({
    Key key,
    @required this.objective,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppColors.defaultShadow,
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 17.w,
        vertical: 12.h,
      ),
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  objective?.title ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
              Visibility(
                visible: false,
                child: Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Owner: ${objective.profissionTitle}' ?? '',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Excution: ${objective.excutionProgress.value}% | Weight: ${objective.weight}% | Performance: ${objective.perforemanceProgress.value}%' ??
                '',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
