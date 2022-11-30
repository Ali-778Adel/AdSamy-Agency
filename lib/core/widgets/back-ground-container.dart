import 'package:flutter/material.dart';

import '../resources/palette.dart';

class BackGroundContainer extends StatelessWidget {
  final Widget child;
  const BackGroundContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter.add(Alignment.centerLeft),
            end: Alignment.bottomLeft,
            colors: [
              Colors.white.withOpacity(.27),
              Palette.darkLight.withOpacity(.27),
              Palette.darkBlue.withOpacity(.27)
              ,
            ],
          ),
        ),
    child: child,
    );
  }
}
