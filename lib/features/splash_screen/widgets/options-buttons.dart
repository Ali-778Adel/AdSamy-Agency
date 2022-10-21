import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  final double opacity;
  const OptionsButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 14),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 80 / 100,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Palette.darkBlue.withOpacity(opacity),
              onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: onTap,
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
