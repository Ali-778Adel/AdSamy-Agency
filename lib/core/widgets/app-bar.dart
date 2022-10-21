import 'package:ad_samy/features/authentiacation/presentation/resources/dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar{
final String appBarTitle;
MyAppBar({required this.appBarTitle});
  PreferredSizeWidget call(){
    return PreferredSize(
        preferredSize:  Size.fromHeight(Dimens.h1),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(.96),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
          elevation: 0,
          title: Container(
            height: kToolbarHeight,
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment:Alignment.bottomLeft,
              child: Text(
              appBarTitle,
              style: TextStyle(
                color: Palette.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: Dimens.subtitle1,
                overflow: TextOverflow.visible
                ,),
        ),
            ),
          ),));
  }
}