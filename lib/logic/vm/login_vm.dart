import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/models/user.dart';
import 'package:ara_vnext/logic/services/auth_services.dart';
import 'package:ara_vnext/views/shared/utils/app_router.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final _authServices = sl<AuthServices>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validateEmail() {
    bool startWithNumber = emailController.text.startsWith(RegExp(r'[0-9]'));
    bool isEmpty = emailController.text.isEmpty || emailController.text == null;
    bool dosntContainAt = !emailController.text.contains('@');
    if (isEmpty) {
      AppRouter.showSnackBar(SnackBar(
        content: Text('email can not be empty !'),
        backgroundColor: Colors.red,
      ));
      return false;
    } else if (startWithNumber) {
      AppRouter.showSnackBar(SnackBar(
        content: Text('email should not start with number !'),
        backgroundColor: Colors.red,
      ));
      return false;
    } else if (dosntContainAt) {
      AppRouter.showSnackBar(SnackBar(
        content: Text('email should contain @ !'),
        backgroundColor: Colors.red,
      ));
      return false;
    } else
      return true;
  }

  bool validatePassword() {
    if (passwordController.text.isNotEmpty &&
        passwordController.text != null &&
        passwordController.text.length >= 8) {
      return true;
    } else
      AppRouter.showSnackBar(SnackBar(
        content: Text(
          'please enter a valid password contains 8 digits at least!',
        ),
        backgroundColor: Colors.red,
      ));
    return false;
  }

  bool isPasswordValid, isEmailValid;

  UserData user;

  Future login() async {
    isEmailValid = validateEmail();
    print(isEmailValid);
    if (!isEmailValid) {
      return;
    }
    isPasswordValid = validatePassword();
    if (!isPasswordValid) {
      return;
    }
    if (isEmailValid && isPasswordValid) {
      // call the api here
      Map<String, dynamic> data = {
        'username': emailController.text,
        'password': passwordController.text,
      };
      user = await _authServices.login(data);
    } else {
      AppRouter.showSnackBar(SnackBar(
        content: Text('please enter valid email and password !'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
