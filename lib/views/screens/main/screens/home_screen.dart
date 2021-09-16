import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/vm/home_vm.dart';
import 'package:ara_vnext/views/shared/widgets/loding_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './widgets/home_header.dart';
import './widgets/home_tabs.dart';
import './widgets/search_input.dart';
import './widgets/home_expantion_tile.dart';

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


