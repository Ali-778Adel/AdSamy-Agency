import 'package:ad_samy/applications/lead-application/services/presentation/pages/lead-home-page-controller.dart';
import 'package:ad_samy/applications/lead-application/services/presentation/pages/lead-home-page.dart';
import 'package:ad_samy/core/core-features/splash_screen/widgets/options-buttons.dart';
import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/widgets/intro-background-container.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../landing-pages/pages/lead-landing-page.dart';
import '../../resources/palette.dart';
import '../authentiacation/presentation/widgets/spacer-v.dart';
import 'login-options.dart';


class MainLoginOption extends StatelessWidget {
  const MainLoginOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(elevation: 0.0,backgroundColor: Colors.transparent,),
      body:_buildBody(context) ,
    );
  }
  Widget _buildBody(BuildContext context){
    return  SafeArea(
      child:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: IntroBackGroundContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 37.0,vertical: 48.sp),
                  child: CircleAvatar(
                    radius: CoreDimens.cardH3,
                    backgroundColor: Colors.transparent,
                   child: Image.asset('assets/splash_screen/logo.png',fit: BoxFit.contain,),
                  ),
                ),
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 48.sp),
                  child: OptionsButton(
                  buttonText: 'Home',
                  onTap: () {
                    context.goTo(context, LeadHomePageController(),);
                  },),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1
                          ,child: Divider(thickness: 2,color: Palette.white,)),
                       Expanded(
                         flex: 1,
                         child: Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: Center(child: Text('OR',style: Theme.of(context).textTheme.headline1!.copyWith(color: Palette.white),)),
                      ),
                       ),
                       Expanded(
                         flex: 1,
                           child: Divider(thickness: 2,color: Palette.white,)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40.sp),
                  child: TextButton(onPressed: (){

                    context.goTo(context, LoginOptions());
                  },child: Text('Sign in',style: Theme.of(context).textTheme.headline1!.copyWith(color: Palette.yellowPrimary),),),
                ),
                SpacerV(value: 40,)
              ],
            ),
          ),
      ),
    );
  }
}
