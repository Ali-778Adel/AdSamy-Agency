import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/splash_screen/widgets/options-buttons.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';

import '../authentiacation/presentation/pages/login.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,

      appBar: AppBar(backgroundColor:Palette.white ,title:Text ('Privacy&Policy',style: Theme.of(context).textTheme.headline1,),elevation: 0.0,centerTitle: true,),
      body: _buildBody(context: context),

    );
  }

  Widget _buildBody({required BuildContext context}){
    return Padding(padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 8.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          RichText(text: TextSpan(
            style:const TextStyle(height: 2.0),
              children: [
            TextSpan(text: '-  ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: 'We don’t ask you for personal information unless we truly need it.\n',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: '-  ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: 'We don’t share your personal information with anyone except to comply with the law, develop our products, or protect our rights.\n',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: '-  ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: 'We don’t store personal information on our servers unless required for the on-going operation of one of our services.\n',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: '-  ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: 'Below is our privacy policy which incorporates these goals:\n',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: '*  ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: 'If you have questions about deleting or correcting your personal data please contact our support team.\n',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: '*  ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
            TextSpan(text: 'The following privacy policy agreement is associated with the Scriptdm.com website, services and products available at or through the website, including, but not limited to, scriptdm.com mobile apps and SMS services (collectively, “Script Digital Marketing Solutions”). It is Script Digital Marketing Solutions’s policy to respect your privacy regarding any information we may collect while operating our services.\n',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack) ),
          ]),),
          Center(child: OptionsButton(buttonText: 'Accept and continue', opacity: 0.3,onTap: (){
            Navigator.pop(context);        },),)
        ],
      ),
    ),
    );
  }
}
