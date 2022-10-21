// ignore_for_file: file_names

import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-event.dart';
import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-bloc.dart';
import 'package:ad_samy/features/profile/presentation/profile-bloc/profile-bloc.dart';
import 'package:ad_samy/features/profile/presentation/profile-bloc/profile-events.dart';
import 'package:ad_samy/features/profile/presentation/profile-bloc/profile-states.dart';
import 'package:ad_samy/features/profile/presentation/widgets/profile-field-item.dart';
import 'package:ad_samy/features/splash_screen/login-options.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/landing-pages/pages/client-landing-page.dart';
import 'package:ad_samy/landing-pages/pages/employee-landing-page.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/core-dimens.dart';
import '../../../team-projects/presentation/bloc/team-bloc.dart';
import '../profile-bloc/profile-states.dart';
class ProfileMainPage extends StatelessWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Palette.white,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity,CoreDimens.h3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: BlocBuilder<ProfileBloc,ProfileStates>(
              builder: (context, state) {
                if(state is GetUserCachedDataState){
                  return AppBar(
                    elevation: 0.0,
                    backgroundColor: Palette.white,
                    leading: IconButton(icon: CircleAvatar(
                      radius: 25,
                      backgroundColor: Palette.darkBlue,
                      child: Center (child: Icon(CupertinoIcons.back,color: Palette.white,size: CoreDimens.h8,)),
                    ),onPressed: (){
                      if(state.userCacheEntity!.user!.type=='client'){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientLandingPage()));
                        BlocProvider.of<ClientProjectBloc>(context).add(GetAllClientProjectsEvent(clientToken: state.userCacheEntity!.user!.token));
                      }else if(state.userCacheEntity!.user!.type=='team'){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmployeeLandingPage()));
                        BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(teamToken: state.userCacheEntity!.user!.token));
                      }
                    },),
                  );
                }else{
                  return const SizedBox();
                }

              }
            ),
          ),
        ),
        restorationId: 'profileMainPage',
        body: _buildBody(context),
      );


      
  }
  Widget _buildBody(BuildContext context){
    return   SafeArea(
        child:  BlocBuilder<ProfileBloc,ProfileStates>(
          builder: (context, state) {
            if(state is GetUserCachedDataState){
              if(state.psProgressType == PSProgressType.getUserData){
                switch(state.psProgressStatus){
                  case PSProgressStatus.loading:{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  case PSProgressStatus.failure:{
                    return const Center(child:Text('data'),);
                  }
                  case PSProgressStatus.success:{
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          key:const Key('pageTitleKey'),
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildPageTitle(
                              context:context,
                              userName: '${state.userCacheEntity!.user!.name}',
                              userEmail:  '${state.userCacheEntity!.user!.email}',

                            ),

                            _buildProfileItem(context:context,getUserCachedDataState: state)

                          ],
                        ),
                      ),

                    );
                  }
                  default:{
                    return Container();
                  }
                }
              }

            }
            return Container();
          }
        ));
  }

  Widget _buildPageTitle({BuildContext? context,String?userName,String ? userEmail}){
    return SizedBox(
      height: context!.heightInPercent(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Profile ',style:  Theme.of(context).textTheme.headline1,),
        ),
        Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Palette.darkGrey),
                borderRadius: BorderRadius.circular(60),
              ),
              child:  const Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 50,
                  foregroundImage:AssetImage('assets/splash_screen/profile2.png',) ,
                ),


              ),
            ),
            Positioned(
              bottom: -7,
               left: -5,
                child: IconButton(icon: CircleAvatar(
                  radius: 25,
                  backgroundColor: Palette.darkGrey,
                  child: Center (child: Icon(CupertinoIcons.pen,color: Palette.white,size: CoreDimens.h6,)),
                ),onPressed: (){},))
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
          child:Text(userName?? 'Ali Adel',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack),),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child:Text(userEmail??'ali5000000020@gmail.com',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack,),
          )

          )],
      ),
    );
  }

  Widget _buildProfileItem({required BuildContext context,GetUserCachedDataState ?getUserCachedDataState}){
    return SizedBox(
      height: context.heightInPercent(60),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileFieldItem(title: 'Home', leadingIcon: CupertinoIcons.home,onTap:(){
            if(getUserCachedDataState!.userCacheEntity!.user!.type=='client'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientLandingPage()));
              BlocProvider.of<ClientProjectBloc>(context).add(GetAllClientProjectsEvent(clientToken: getUserCachedDataState.userCacheEntity!.user!.token));
            }else if(getUserCachedDataState.userCacheEntity!.user!.type=='team'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmployeeLandingPage()));
              BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(teamToken: getUserCachedDataState.userCacheEntity!.user!.token));
            }
          } ,),
          ProfileFieldItem(title: 'Phone Number', leadingIcon: CupertinoIcons.phone,onTap: (){
            context.showMessage(getUserCachedDataState!.userCacheEntity!.user!.phone??'no phone number inserted');
          },),
          // ProfileFieldItem(title: 'Settings', leadingIcon: CupertinoIcons.settings_solid),
          BlocBuilder<ProfileBloc,ProfileStates>(
            builder: (context, state) {
              return ProfileFieldItem(
                title: 'Log out', leadingIcon:Icons.logout,onTap: (){
                  context.showLogOutMessage('Do you want to log out ',(){
                    context.dismiss();
                    context.goTo(context,const LoginOptions());
                    BlocProvider.of<ProfileBloc>(context).add(DeleteUserCachedDataEvent());
                  });

              },);
            }
          ),
        ],
      ),
    );
  }
}
