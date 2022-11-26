import 'package:flutter/material.dart';

import '../resources/palette.dart';

class IntroBackGroundContainer extends StatelessWidget {
  final Widget child;
  const IntroBackGroundContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment(0.49999999999999983, 0.9999999999999999),
    end: Alignment(0.5, -1.1102230246251565e-16),
    colors: [const Color(0x9e1d5e83), const Color(0x00d9d9d9)])
    ),
      child: child,
    );
  }
}

class IntroBackGroundContainer1 extends StatelessWidget {
  final Widget child;
  const IntroBackGroundContainer1({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Container(
   width: MediaQuery.of(context).size.width,
   height: MediaQuery.of(context).size.height,
   decoration: BoxDecoration(
   gradient: LinearGradient(
   end: Alignment(0.49999999999999983, 0.9999999999999999),
    begin: Alignment(0.5, -1.1102230246251565e-16),
    colors: [ const Color(0x00d9d9d9),const Color(0x9e1d5e83),])

   ),
       child: child,
    );
  }
}