import 'package:ad_samy/features/authentiacation/presentation/widgets/spacer-v.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/loading-widget.dart';
import '../../features/authentiacation/presentation/resources/dimens.dart';
import '../../core/resources/palette.dart';

extension ContextExtensions on BuildContext {
  bool isMobile() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;

    return shortestSide < 600;
  }

  dynamic back([dynamic result]) => Navigator.pop(this, result);

  Future<dynamic> goTo(BuildContext context,Widget routeName, {Object? args}) =>
      Navigator.push(this, MaterialPageRoute(builder: (context)=>routeName));

  Future<dynamic>pushNamed(BuildContext context,String routeName){
    return Navigator.pushNamed(context, routeName);
  }

  Future<dynamic> goToReplace(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  Future<dynamic> goToClearStack(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (Route<dynamic> route) => false,
        arguments: args,
      );

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (c) {
          ctx = c;

          return WillPopScope(
            onWillPop: () async => true,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
                  padding: EdgeInsets.all(Dimens.space24),
                  child: Wrap(children: const [LoadingWidget()]),
                ),
              ),
            ),
          );
        },
      );

  Future<void> showMessage(String message) => showDialog(
    context: this,
    barrierDismissible: false,
    builder: (c) {
      ctx = c;
      return WillPopScope(
        onWillPop: () async => true,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(Dimens.cornerRadius),
              ),
              margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
              padding: EdgeInsets.all(Dimens.space24),
              child: Wrap(
                  direction: Axis.vertical,
                  children:[
                Text(message),
                const SpacerV(),
                TextButton(onPressed: ()=>ctx.dismiss(), child:const Text('Ok',))
              ]),
            ),
          ),
        ),
      );
    },
  );
  Future<void> showLogOutMessage(String message,Function() onTap) => showDialog(
    context: this,
    barrierDismissible: true,
    builder: (c) {
      ctx = c;
      return WillPopScope(
        onWillPop: () async => false,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(Dimens.cornerRadius),
              ),
              margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
              padding: EdgeInsets.all(Dimens.space24),
              child: Wrap(
                  direction: Axis.vertical,
                  children:[
                    Text(message),
                    const SpacerV(),
                    TextButton(onPressed: onTap, child:const Text('Ok',))
                  ]),
            ),
          ),
        ),
      );
    },
  );

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}
