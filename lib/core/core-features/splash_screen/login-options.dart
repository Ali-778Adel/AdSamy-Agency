import 'package:ad_samy/core/core-features/splash_screen/widgets/options-buttons.dart';
import 'package:ad_samy/core/widgets/app-bar.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import '../../resources/core-dimens.dart';
import '../../widgets/intro-background-container.dart';
import '../authentiacation/presentation/pages/login.dart';
import '../authentiacation/presentation/widgets/spacer-v.dart';

class LoginOptions extends StatefulWidget{
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return _LoginOptionsState();
  }

}

class _LoginOptionsState extends State<LoginOptions>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().call(context: context),
      body:_buildBody()
    );
  }
  Widget _buildBody(){
    return
            SingleChildScrollView(
              child: IntroBackGroundContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: CoreDimens.cardH3,
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/splash_screen/logo.png',fit: BoxFit.contain,),
                    ),
                    SpacerV(value: CoreDimens.h3,),
                    Padding(
                      padding: const EdgeInsets.only(top: 24,bottom: 24),
                      child: Text('Sign in as ',style: Theme.of(context).textTheme.headline1,),
                    ),
                     OptionsButton(buttonText: ' Client', onTap:(){
                     context.goTo(context,const Login(type: 'client',));
                    }, ),
                    OptionsButton(buttonText: 'Employee', onTap:(){
                    context.goTo(context,const Login(type: 'team',));
                    }, )
                  ],
                ),
              ),
            );

}

Widget _buildOptions(){
    return Padding(padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      OptionsButton(buttonText: 'Continue As Client', onTap:(){
        context.goTo(context,const Login(type: 'client',));
      }, ),
      OptionsButton(buttonText: 'Continue As Employee ', onTap:(){
        context.goTo(context,const Login(type:'team',));
      },),
    ],
    ),
    );

}
}