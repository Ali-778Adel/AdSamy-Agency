import 'package:ad_samy/features/authentiacation/presentation/resources/dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String pageTitle;
  const PageTitle({Key? key,required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(00),
      child: Center(
        child: ListTile(
          title: CircleAvatar(
            radius:MediaQuery.of(context).size.height*.09,
            backgroundColor: Colors.lightBlue.withOpacity(.01),
              child: Image.asset(
            'assets/splash_screen/logo.png',
            fit: BoxFit.fill,

          )),
          subtitle: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                pageTitle,
                style: TextStyle(
                    fontSize: Dimens.h5,
                    fontWeight: FontWeight.bold,
                    color:Palette.darkBlue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
