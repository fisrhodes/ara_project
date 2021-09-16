import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/functions/check_internet.dart';
import 'package:ara_vnext/logic/models/api_response.dart';
import 'package:ara_vnext/logic/models/user.dart';
import 'package:ara_vnext/logic/services/constant.dart';
import 'package:ara_vnext/logic/services/storage_services.dart';
import 'package:ara_vnext/views/shared/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//this class for authentication methods {login,register,forget password....}
class AuthServices {
  final Dio _auth = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      validateStatus: (status) => status < 500,
      headers: ApiConstant.header,
    ),
  );

  Response response;
  UserData user;

  Future<UserData> login(Map<String, dynamic> data) async {
    bool isConnected = await checkInternetConnection();
    print(isConnected);
    if (isConnected) {
      user = null;
      try {
        response = await _auth.post(ApiConstant.loginUrl, data: data);
        final apiResponse = ApiResponse.fromJson(response.data);
        if (apiResponse.successfull) {
          user = UserData.fromJson(apiResponse.data);
          await sl<StorageServices>().saveUserToLocalStorage(user);
          AppRouter.pushReplacementNamed(AppRoutes.main);
        } else {
          AppRouter.showSnackBar(
            SnackBar(
              content: Text(apiResponse.errorDescription),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print(e);
        AppRouter.showSnackBar(
          SnackBar(
            content: Text('Something wrong !'),
          ),
        );
      }
      return user;
    } else {
      AppRouter.showNoInternetMessage();
      return null;
    }
  }
}
