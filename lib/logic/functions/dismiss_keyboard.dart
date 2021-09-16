
import 'package:ara_vnext/views/shared/utils/app_router.dart';
import 'package:flutter/cupertino.dart';

Future dismisKeyboard() async {
  var keyboardHieght =
      MediaQuery.of(AppRouter.dialogContext)
          .viewInsets
          .bottom;
  if (keyboardHieght != 0) {
    FocusScope.of(AppRouter.navKey.currentState.overlay.context)
        .requestFocus(new FocusNode());
    await Future.delayed(Duration(milliseconds: 200));
  } else {
    // print('No Keyboard');
  }
}