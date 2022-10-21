import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
          width:MediaQuery.of(context).size.width*86/100,
          height: ServicesDimens.cardH1,
          margin: const EdgeInsets.all(0),
          child: Image.asset('assets/splash_screen/header.png',fit: BoxFit.cover
            ,),),
    );
  }
}
