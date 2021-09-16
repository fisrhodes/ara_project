import 'package:ara_vnext/logic/services/storage_services.dart';

import '../../locator.dart';

class ApiConstant {
  static const String baseUrl = 'https://api-stg.arastrategy.com/';
  static const String loginUrl = 'user/authenticate';
  static const String homeUrl =
      'strategy/flatten/3a496af1-515e-4119-bb41-2e0c183a6ba2?strategyElements=OBJECTIVE';

  static  Map<String, dynamic> header = {
    'content-type': 'application/json',
    'Accept-Encoding': 'application/json',
    'x-tenant-id': 'bc8f72c6-a125-4d67-8892-8850ee90806c',
    'x-app-key': '2b53bbf9-6af7-49db-8eed-c330139e0147'
  };

  static Map<String, dynamic> headerWithToken() {
    final String _userToken = sl<StorageServices>().user?.token;
    Map<String, dynamic> header = ApiConstant.header;
    header['Authorization'] = _userToken;
    return header;
  }
}
