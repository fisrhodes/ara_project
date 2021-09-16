import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/data/dummy_data.dart';
import 'package:ara_vnext/logic/functions/convertDateToString.dart';
import 'package:ara_vnext/logic/models/home_data.dart';
import 'package:ara_vnext/logic/vm/home_vm.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:ara_vnext/views/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './widgets/home_header.dart';
import './widgets/home_tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    sl<HomeViewModel>().loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return model.isLoading
              ? AppLoadingIndecator()
              : Stack(
                  children: [
                    //HomeHeader
                    HomeHeader(
                      title: model.homeData.strategyTitle,
                    ),
                    Positioned(
                      top: 155.2.h,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            child: HomeExpandedTile(
                              homeData: model.homeData,
                            ),
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            child: SearchInput(),
                          ),
                          // MyTabBar(),
                          SizedBox(
                            height: 15.h,
                          ),
                          // HomeTabs(),
                          Expanded(
                            child: HomeTabs(
                              objectives: model.homeData.objectives,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}

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

//Home Widget
class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45.h,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'search',
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                alignLabelWithHint: true,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          child: Image.asset(
            AppImages.adjust,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}

//Home Widget
class HomeCard extends StatelessWidget {
  final HomeCardData cardData;
  final Objective objective;

  const HomeCard({
    Key key,
    @required this.cardData,
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
                visible: this.cardData?.hasWarnning == true,
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
