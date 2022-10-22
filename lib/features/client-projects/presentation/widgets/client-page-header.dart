import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/landing-pages/pages/client-landing-page.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/palette.dart';

class ClientPageHeader extends StatelessWidget {
  const ClientPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: CoreDimens.h1,
        width:double.infinity,
        padding: const EdgeInsets.all(16.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius:CoreDimens.h4,
              child: Image.asset('assets/splash_screen/logo.png',fit: BoxFit.contain,),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                CupertinoIcons.bell_fill,
                size: CoreDimens.h5,
                color: Palette.darkBlue,
              ), onPressed: () {
              context.goTo(context,const ClientLandingPage(navIndex: 1,));
            },)
          ],
        )
    );

  }
}
