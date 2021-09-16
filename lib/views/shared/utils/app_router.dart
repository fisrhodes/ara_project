import 'package:ara_vnext/views/screens/login/login_screen.dart';
import 'package:ara_vnext/views/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: RouteSettings(
            name: AppRoutes.login,
          ),
        );
      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
          settings: RouteSettings(
            name: AppRoutes.main,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Wrong route'),
            ),
          ),
        );
    }
  }

  static BuildContext dialogContext = navKey.currentState.overlay.context;

  static Future pushNamed(String route, {dynamic args}) {
    return navKey.currentState.pushNamed(route, arguments: args);
  }

  static pop({dynamic args}) {
    return navKey.currentState.pop();
  }

  static Future pushNamedAndRemoveUntil(String route,
      {dynamic args, String route2}) {
    return navKey.currentState.pushNamedAndRemoveUntil(
      route,
      route2 != null ? ModalRoute.withName(route2) : (_) => false,
      arguments: args,
    );
  }

  static Future popAndPush(String route, {dynamic args}) {
    return navKey.currentState.popAndPushNamed(route, arguments: args);
  }

  static Future pushReplacementNamed(String route, {dynamic args}) {
    return navKey.currentState.pushReplacementNamed(
      route,
      arguments: args,
    );
  }

  static void popUntil(String route, {dynamic args}) {
    return navKey.currentState.popUntil(ModalRoute.withName(route));
  }

  static void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(dialogContext).showSnackBar(snackBar);
  }

  static showNoInternetMessage() {
    AppRouter.showSnackBar(
      SnackBar(
        content: Text('No internet connection !'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class AppRoutes {
  static const String login = 'loginScreen';
  static const String main = 'mainScreen';
}
