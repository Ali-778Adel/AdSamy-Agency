
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  final String title;
  const PageTitle({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height: ServicesDimens.h1,
      padding: const EdgeInsets.only(bottom: 20,left: 25),
      color:Colors.lightBlue.withOpacity(.01),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(title,style: TextStyle(fontSize: ServicesDimens.subtitle1,color: Palette.darkBlue,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
