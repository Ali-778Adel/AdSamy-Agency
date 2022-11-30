import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core-features/authentiacation/presentation/resources/dimens.dart';

class MyAppBar{
// final String appBarTitle;
// BuildContext context;
MyAppBar();
PreferredSizeWidget call({String?appBarTitle,required BuildContext context}){
    return PreferredSize(
        preferredSize:  Size.fromHeight(Dimens.h1),
        child: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
          elevation: 0,
          title: Container(
            height: kToolbarHeight,
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment:Alignment.bottomLeft,
              child: Text(
              appBarTitle??'',
              style: TextStyle(
                color: Palette.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: Dimens.subtitle1,
                overflow: TextOverflow.visible
                ,),
        ),
            ),
          ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: Palette.darkBlue,
            radius: CoreDimens.h6,
            child:  Center(
              child: IconButton(
                icon: Icon(
                    Icons.arrow_back_ios,
                  size: CoreDimens.h6,
                  color: Palette.white,
                ), onPressed: () {
                  Navigator.of(context).pop();
              },),
            ),
          ),
        ),
        ));
  }
}