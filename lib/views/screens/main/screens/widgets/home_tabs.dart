import 'package:ara_vnext/logic/models/home_data.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './objective_card.dart';

//Home Widget
class HomeTabBar extends StatefulWidget {
  final TabController controller;

  const HomeTabBar({Key key, @required this.controller}) : super(key: key);
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.controller,
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: AppColors.primaryBlue,
      automaticIndicatorColorAdjustment: true,
      // indicatorWeight: 150.w,

      onTap: (_) {
        print(_);
        // widget.onChaneg?.call(_);
      },
      labelStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 13.sp,
      ),
      tabs: [
        Tab(text: 'Financial Perspective'),
        Tab(text: 'Customer Perspective'),
        Tab(text: 'Third Tab'),
        Tab(text: 'Fourth Tab'),
      ],
    );
  }
}

//Home Widget
class HomeTabs extends StatefulWidget {
  const HomeTabs({Key key, @required this.objectives}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
  final List<Objective> objectives;
}

class _HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      vsync: this,
      length: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTabBar(
          controller: controller,
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              //Financial Perspective
              ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 15.5.h,
                ),
                itemBuilder: (context, index) {
                  return ObjectiveCard(
                    objective: widget.objectives[index],
                  );
                },
                itemCount:widget.objectives.length,
              ),
              //Customer Perspective
              ListView(),
              ListView(),
              ListView(),
            ],
          ),
        ),
      ],
    );
  }
}
