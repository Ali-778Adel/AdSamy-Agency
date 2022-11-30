import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../core/resources/core-dimens.dart';


class CustomProgressIndicator extends StatelessWidget {
  final double progressValue;
  const CustomProgressIndicator({Key? key, required this.progressValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: [
                      TextSpan(
                        text: '\n\n Progress \n\n',
                        style: TextStyle(
                            color: Palette.darkBlue,
                            fontSize: CoreDimens.subtitle2),
                      ),
                      TextSpan(
                        text: 'Tasks Based Progress',
                        style: TextStyle(
                            color: Colors.black26, fontSize: CoreDimens.body1),
                      )
                    ]),
                  )),
              Expanded(
                flex: 1,
                child: CircularPercentIndicator(
                  radius: CoreDimens.h80,
                  lineWidth: 20.0,
                  arcType: ArcType.HALF,
                  progressColor: Palette.yellowPrimary,
                  arcBackgroundColor: Palette.darkBlue,
                  animation: true,
                  reverse: false,
                  animationDuration: 1000,
                  percent: progressValue,
                  center: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: ' ${progressValue * 100}%\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: CoreDimens.subtitle2),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
