import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final bool withError;
  const CustomSnackBar({Key key, @required this.message, this.withError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message ?? ''),
      backgroundColor: withError == true ? Colors.red : AppColors.primaryBlue,
    );
  }
}

const CustomSnackBar noInternetSnackBar = CustomSnackBar(
  message: 'No interent connection',
  withError: true,
);
