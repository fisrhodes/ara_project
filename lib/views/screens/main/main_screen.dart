import 'package:ara_vnext/logic/functions/logout.dart';
import 'package:ara_vnext/views/screens/main/screens/home_screen.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }

  List<Widget> mainTabs = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(
      child: Center(
        child: TextButton(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            logout();
          },
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainTabs[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (newIndex) {
            changeIndex(newIndex);
          },
          selectedItemColor: AppColors.primaryBlue,
          selectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          iconSize: 28.h,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_open_outlined,
              ),
              label: 'My page',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outlined),
              label: 'to Do',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'settings',
            ),
          ],
        ),
      ),
    );
  }
}
