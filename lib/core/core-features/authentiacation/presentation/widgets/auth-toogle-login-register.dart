import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';

import '../../../../resources/palette.dart';
import '../resources/dimens.dart';

class ToggleLoginRegisterWidget extends StatelessWidget {
  final Widget destination;
  final String optionText;
  final String buttonText;
  const ToggleLoginRegisterWidget({Key? key,required this.destination,required this.optionText,required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(optionText,style:TextStyle(color:Palette.primary,fontSize: Dimens.subtitle1),),
        TextButton(onPressed: (){
          context.goTo(context, destination);
        }, child: Text(buttonText,style: TextStyle(color: Palette.darkBlue,fontSize: Dimens.subtitle1),))
      ],
    );
  }
}
