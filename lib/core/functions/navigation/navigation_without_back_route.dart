import 'package:flutter/material.dart';

Future navigationWithoutBackRoute(
    {required BuildContext context, required Widget widget}) async {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
