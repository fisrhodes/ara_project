import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xfff2258bf);
  static const Color darkGreyBlue = Color(0xfff342e59);

  static const shadowColor = Color(0xfff12000000);

  static const defaultShadow = <BoxShadow>[
    BoxShadow(
      blurRadius: 9,
      spreadRadius: 0,
      offset: Offset(0, 3),
      color: shadowColor,
    ),
  ];

  static LinearGradient blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xfff008ced),
      AppColors.primaryBlue,
    ],
  );
}
