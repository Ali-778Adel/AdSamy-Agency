 import 'package:ad_samy/core/functions/navigation/navigation_without_back_route.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/core/widgets/intro-background-container.dart';
import 'package:ad_samy/core/widgets/loading-widget.dart';
import 'package:ad_samy/landing-pages/pages/employee-landing-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../landing-pages/pages/client-landing-page.dart';
import '../authentiacation/domain/entities/login-entity.dart';
import '../authentiacation/presentation/bloc/auth-bloc.dart';
import '../authentiacation/presentation/bloc/auth-events.dart';
import '../authentiacation/presentation/bloc/auth-states.dart';
import 'login-options.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value)
       =>
           navigationWithoutBackRoute(context: context, widget:_whichLandingWidget() )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: IntroBackGroundContainer(
        child: Center(child: Image.asset(
          'assets/splash_screen/logo.png',
          fit: BoxFit.contain,
           height:  MediaQuery.of(context).size.height/4,
          width:  MediaQuery.of(context).size.width/2,
        )),
      ),
    );
  }

  Widget _whichLandingWidget(){
   return BlocBuilder<AuthBloc,AuthState>(
       builder: (context,state){
         BlocProvider.of<AuthBloc>(context).add(GetAuthCachedDataEvent());
         switch(state.progressStatus){
           case ProgressStatus.loading:{
             return const LoadingWidget();
           }case ProgressStatus.failure:{
             return const LoginOptions();
         }case ProgressStatus.success:{
           final st=state.progressEntity as  LoginEntity;
            if(st.success!&&st.user!=null){
              if(st.user!.type=='client'){
                return const ClientLandingPage();
              }else if(st.user!.type=='team'){
                return const EmployeeLandingPage();
              }else{
                return const LoginOptions();
              }
            }else{
              return const LoginOptions();
            }
         }
           default:{
             return const Center(child: Text('some thing went wrong please try again later '),);
           }
         }

   });

  }
}
