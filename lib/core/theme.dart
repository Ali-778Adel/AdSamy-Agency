import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:flutter/material.dart';

ThemeData appTheme=ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Palette.darkBlue,
      fontWeight: FontWeight.bold,
      fontSize: ServicesDimens.header1,

    ),
    bodyText1: TextStyle(
      fontSize: ServicesDimens.subtitle4,
      color:  Palette.darkLight,
      fontWeight: FontWeight.w600
    )
  )


);