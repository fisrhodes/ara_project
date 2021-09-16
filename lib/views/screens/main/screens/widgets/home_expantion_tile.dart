import 'package:ara_vnext/logic/functions/convertDateToString.dart';
import 'package:ara_vnext/logic/models/home_data.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:ara_vnext/views/shared/widgets/circular_chart.dart';
import 'package:ara_vnext/views/shared/widgets/linear_indecaror.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//Home Widget
class HomeExpandedTile extends StatelessWidget {
  final HomeData homeData;

  final titleStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  final valueStyle = TextStyle(
    color: AppColors.darkGreyBlue,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  HomeExpandedTile({Key key, @required this.homeData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppColors.defaultShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          tilePadding: EdgeInsets.fromLTRB(17.w, 13.h, 17.w, 13.6.h),
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          collapsedBackgroundColor: Colors.white,
          textColor: Colors.black,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Owner',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    homeData?.professionTitle ??
                        'Operation Director - Dubai Store',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 7.w,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xfffb0f5d4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'DEFAULT',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Color(0xfff13b440),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.only(
            left: 17.w,
            right: 17.w,
            bottom: 17.h,
          ),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: titleStyle,
                    ),
                    // Text('timeline'),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 6.h,
                          backgroundColor: Colors.orange,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          homeData?.strategyStatus?.title ?? '',
                          style: valueStyle,
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Timeline',
                      style: titleStyle,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      '${convertDateToString(homeData.startDate)} - ${convertDateToString(homeData.endDate)}' ??
                          '01/01/2020 - 31/12/2020',
                      style: valueStyle,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearIndecator(
                  label: 'excution',
                  minValue: 0,
                  maxValue: 100,
                  value: homeData.excutionProgress.value,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 80.h,
                      width: 100.w,
                      child: CircularChart(
                        value: homeData.performanceProgress.value,
                      ),
                    ),
                    Text(
                      'Performance',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.darkGreyBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
