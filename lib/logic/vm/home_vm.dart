import 'package:ara_vnext/logic/models/home_data.dart';
import 'package:ara_vnext/logic/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../enums.dart';

class HomeViewModel with ChangeNotifier {
  final _apiServices = sl<ApiServices>();

  ViewState _state = ViewState.Loaded;

  void setState(ViewState state) {
    this._state = state;
    notifyListeners();
  }

  ViewState get state => _state;

  bool get isLoading => _state == ViewState.Loading;

  HomeData homeData;

  Future loadHomeData() async {
    if (homeData == null) {
      setState(ViewState.Loading);
      homeData = await _apiServices.loadHome();
      setState(ViewState.Loaded);
    }
  }
}

