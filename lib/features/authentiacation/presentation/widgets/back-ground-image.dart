import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(
                  'assets/splash_screen/person.png',
                ),
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1),
                  BlendMode.modulate,
                ),
                fit: BoxFit.fill),
          )),
    );
  }
}
