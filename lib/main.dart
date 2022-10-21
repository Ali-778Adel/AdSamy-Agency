import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-bloc.dart';
import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-event.dart';
import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-bloc.dart';
import 'package:ad_samy/features/profile/presentation/profile-bloc/profile-bloc.dart';
import 'package:ad_samy/features/profile/presentation/profile-bloc/profile-events.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc_events.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ad_samy/di/dependency_injection_container.dart'as da;
import 'core/theme.dart';
import 'features/splash_screen/splash_screen.dart';
import 'features/team-projects/presentation/bloc/team-bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await da.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>da.sl<ShowAllServicesBloc>()..add(ShowAllServicesEvent()),),
          BlocProvider(create: (_)=>da.sl<ProfileBloc>()..add(GetUserCachedDataEvent()),),
          BlocProvider(create: (_)=>da.sl<AuthBloc>(),),
          BlocProvider(create: (_)=>da.sl<ClientProjectBloc>()..add(GetAllClientProjectsEvent()),),
          BlocProvider(create: (_)=>da.sl<TeamBloc>()..add(GetTeamOverViewEvents()),),
        ],
        child:ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
         builder: (BuildContext context, Widget? child) {
            return
            MaterialApp(
              theme: appTheme,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen()
            );
         },));
  }
}
