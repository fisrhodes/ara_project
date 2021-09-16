import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/services/storage_services.dart';
import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:ara_vnext/views/shared/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logic/functions/dismiss_keyboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //for prevent orientation
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          // currentFocus.unfocus();
          dismisKeyboard();
        }else{
          print('object');
        }
      },
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          return MaterialApp(
            title: 'araVNext',
            theme: ThemeData(
              // primarySwatch: AppColors.primaryBlue,
              primaryColor: AppColors.primaryBlue,
              fontFamily: 'Poppins',
            ),
            navigatorKey: AppRouter.navKey,
            initialRoute: sl<StorageServices>().isUserLogged
                ? AppRoutes.main
                : AppRoutes.login,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}

