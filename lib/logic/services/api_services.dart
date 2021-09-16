//this class for make and handle apis request
import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/functions/check_internet.dart';
import 'package:ara_vnext/logic/models/api_response.dart';
import 'package:ara_vnext/logic/models/home_data.dart';
import 'package:ara_vnext/logic/services/constant.dart';
import 'package:ara_vnext/logic/services/storage_services.dart';
import 'package:ara_vnext/views/shared/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices {
  final Dio _api = Dio(
    //this for
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      validateStatus: (status) => status < 500,
      headers: ApiConstant.header,
    ),
  );

  Response response;

  Future<HomeData> loadHome() async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      HomeData homeData;
      await sl<StorageServices>().loadUserFromStorage();
      try {
        response = await _api.get(
          ApiConstant.homeUrl,
          options: Options(
            headers: ApiConstant.headerWithToken(),
          ),
        );
        final ApiResponse apiRes = ApiResponse.fromJson(response.data);
        if (apiRes.successfull) {
          homeData = HomeData.fromJson(apiRes.data);
        } else {
          AppRouter.showSnackBar(
            SnackBar(
              content: Text(apiRes.errorDescription),
              backgroundColor: Colors.red,
            ),
          );
        }
        return homeData;
      } catch (e) {
        print(e);
        AppRouter.showSnackBar(
          SnackBar(
            content: Text('something wrong : $e'),
          ),
        );
        return null;
      }
    } else {
      AppRouter.showSnackBar(
        SnackBar(
          content: Text('No internet connection'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }
}
