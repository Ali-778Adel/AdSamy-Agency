import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  const OptionsButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 14),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 90 / 100,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary:Palette.white,
                primary: Palette.darkBlue,
                onSurface: Palette.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onTap,
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 20,
                    color: Palette.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
