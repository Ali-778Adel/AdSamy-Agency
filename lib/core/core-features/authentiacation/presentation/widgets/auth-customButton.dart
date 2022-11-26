import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';

class AuthCustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  const AuthCustomButton(
      {Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width*80/100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Palette.darkBlue,
              shadowColor: Colors.white,
              // fixedSize: Size(MediaQuery.of(context).size.width * 60, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: onTap,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
