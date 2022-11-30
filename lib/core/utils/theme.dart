import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';


ThemeData appTheme=ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Palette.darkBlue,
      fontWeight: FontWeight.bold,
      fontSize: CoreDimens.header1,

    ),
    bodyText1: TextStyle(
      fontSize: CoreDimens.subtitle4,
      color:  Palette.darkLight,
      fontWeight: FontWeight.w600
    )
  )


);