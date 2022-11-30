import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../applications/client-application/client-features/client-projects/presentation/client-bloc/client-event.dart';
import '../applications/lead-application/services/presentation/lead-blocs/lead-home-page-bloc/bloc_events.dart';
import '../applications/lead-application/services/presentation/pages/lead-home-page.dart';
import '../applications/lead-application/services/presentation/pages/leading-info-page.dart';
import '../applications/lead-application/services/presentation/pages/service-details-page.dart';
import '../core/core-features/profile/presentation/profile-bloc/profile-bloc.dart';
import '../core/core-features/profile/presentation/profile-bloc/profile-events.dart';
import '../applications/client-application/client-features/client-projects/presentation/client-bloc/client-bloc.dart';
import '../applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/bloc-test.dart';
import '../applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/bloc.dart';
import '../applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/events.dart';
import '../applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-bloc.dart';
import '../applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-events.dart';
import '../applications/lead-application/services/presentation/lead-blocs/lead-home-page-bloc/bloc.dart';
import '../core/core-features/authentiacation/domain/entities/login-entity.dart';
import '../core/core-features/authentiacation/presentation/bloc/auth-bloc.dart';
import '../core/core-features/authentiacation/presentation/bloc/auth-events.dart';
import '../core/core-features/authentiacation/presentation/bloc/auth-states.dart';
import '../core/core-features/splash_screen/onboarding-screen.dart';
import '../core/core-features/splash_screen/splash_screen.dart';
import '../core/utils/theme.dart';
import '../core/widgets/loading-widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ad_samy/di/dependency_injection_container.dart' as da;
class Launch {
  Widget call(){
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
            da.sl<ShowAllServicesBloc>()..add(ShowAllServicesEvent()),
          ),
          BlocProvider(
            create: (_) => da.sl<ProfileBloc>()..add(GetUserCachedDataEvent()),
          ),
          BlocProvider(
            create: (_) => da.sl<AuthBloc>(),
          ),
          BlocProvider(
            create: (_) =>
            da.sl<ClientProjectBloc>()..add(GetAllClientProjectsEvent()),
          ),
          BlocProvider(
            create: (_) =>
            da.sl<EmployeeAllTasksBloc>()..add(GetEmployeeAllTasksEvent()),
          ),
          BlocProvider(
            create: (_) => da.sl<TeamBloc>()
              ..add(GetTeamOverViewEvents(wichCycle: WichCycle.homeCycle)),
          ),
          BlocProvider(
              create: (_) => da.sl<BlocTest>()
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
                onGenerateRoute: (settings){

                  if(settings.name=='/'){
                    return MaterialPageRoute(builder: (context)=>LeadHomePage());
                  }
                  else if(settings.name=='service_details'){
                    return MaterialPageRoute(builder: (context)=>const ServiceDetailsPage());
                  }
                  else if(settings.name=='service_details/lead_form'){
                    return MaterialPageRoute(builder: (context)=>LeadingInfoPage());
                  }
                  return null;

                },
                theme: appTheme,
                debugShowCheckedModeBanner: false,
                home : _whichLandingWidget());
          },
        ));
  }
  Widget _whichLandingWidget(){
    return BlocBuilder<AuthBloc,AuthState>(
        builder: (context,state){
          BlocProvider.of<AuthBloc>(context).add(GetAuthCachedDataEvent());
          switch(state.progressStatus){
            case ProgressStatus.loading:{
              return const LoadingWidget();
            }case ProgressStatus.failure:{
            return const SplashScreen();
          }case ProgressStatus.success:{
            final st=state.progressEntity as  LoginEntity;
            if(st.success!&&st.user!=null){
              return const SplashScreen();
            }else{
              return const OnBoardingScreen();
            }
          }
            default:{
              return const OnBoardingScreen();
            }
          }

        });

  }

}