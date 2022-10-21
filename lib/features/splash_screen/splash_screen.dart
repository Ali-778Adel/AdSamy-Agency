 import 'package:ad_samy/core/functions/navigation/navigation_without_back_route.dart';
import 'package:ad_samy/core/widgets/loading-widget.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-bloc.dart';
import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-events.dart';
import 'package:ad_samy/features/splash_screen/login-options.dart';
import 'package:ad_samy/landing-pages/pages/employee-landing-page.dart';
import 'package:ad_samy/landing-pages/pages/lead-landing-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../landing-pages/pages/client-landing-page.dart';
import '../authentiacation/presentation/bloc/auth-states.dart';

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
           navigationWithoutBackRoute(context: context, widget:_wichLandingWidget() )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(100),
      color:  Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Center(child: Image.asset(
        'assets/splash_screen/logo.png',
        fit: BoxFit.contain,
         height:  MediaQuery.of(context).size.height/4,
        width:  MediaQuery.of(context).size.width/2,
      )),
    );
  }

  Widget _wichLandingWidget(){
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
