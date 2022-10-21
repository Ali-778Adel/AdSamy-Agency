import 'package:ad_samy/features/authentiacation/presentation/pages/login.dart';
import 'package:ad_samy/features/splash_screen/widgets/options-buttons.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/back-ground-container.dart';
import '../../landing-pages/pages/lead-landing-page.dart';
import '../authentiacation/presentation/resources/dimens.dart';
import '../authentiacation/presentation/widgets/back-ground-image.dart';
import '../authentiacation/presentation/widgets/page-title.dart';
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
      body:_buildBody()
    );
  }
  Widget _buildBody(){
    return SafeArea(
        child: Stack(
          children: [
            const BackGroundImage(),
            BackGroundContainer(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpacerV(
                        value: Dimens.space50,
                      ),
                      const PageTitle(pageTitle: '',),
                      SpacerV(
                        value: Dimens.space50,
                      ),
                      _buildOptions()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
}

Widget _buildOptions(){
    return Padding(padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      OptionsButton(buttonText: 'Continue', onTap:(){
        context.goTo(context,const LeadLandingPage(),);
      }, opacity: .99),
      OptionsButton(buttonText: 'Continue As Client', onTap:(){
        context.goTo(context,const Login(type: 'client',));
      }, opacity: 0.99),
      OptionsButton(buttonText: 'Continue As Employee ', onTap:(){
        context.goTo(context,const Login(type:'team',));
      }, opacity: .98),
    ],
    ),
    );

}
}