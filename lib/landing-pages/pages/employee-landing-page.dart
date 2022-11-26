import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../applications/employee-application/employee-features/employee-all-tasks-feature/presentation/pages/employee-all-tasks-controller-page.dart';
import '../../applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-bloc.dart';
import '../../applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-events.dart';
import '../../applications/employee-application/employee-features/employee-overview-feature/presentation/pages/employee-navigation-controller-.dart';
import '../../applications/employee-application/employee-features/employee-overview-feature/presentation/pages/notification-demo.dart';
import '../../core/core-features/profile/presentation/pages/profile-main-page.dart';
import '../../core/core-features/profile/presentation/profile-bloc/profile-bloc.dart';
import '../../core/core-features/profile/presentation/profile-bloc/profile-events.dart';
import '../widgets/employee-cycle-bottom-nav-bar.dart';

class EmployeeLandingPage extends StatefulWidget {
  final int?navIndex;
  const EmployeeLandingPage({Key? key,this.navIndex}) : super(key: key);

  @override
  State<EmployeeLandingPage> createState() => _EmployeeLandingPageState(navIndex: navIndex);
}

class _EmployeeLandingPageState extends State<EmployeeLandingPage> {
  List<Widget> indexedWidget = [
    const EmployeeNavigationController(),
     EmployeeAllTasksController(),
    const EmployeeNotificationsPageNavigationController(),
    const ProfileMainPage(),
  ];
  _EmployeeLandingPageState({this.navIndex});
  int? navIndex;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      bottomNavigationBar: EmployeeCycleNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            navIndex != null ? currentIndex=navIndex=index:  currentIndex=index;
            switch(index){
              case 0:
              {
                BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(
                  navIndex: BlocProvider.of<TeamBloc>(context).currentIndex,
                  wichCycle: WichCycle.homeCycle
                ));
              }

              break;
              case 1:{

              BlocProvider.of<TeamBloc>(context).add(
                  GetTeamAllTasksEvent
                    (
                      navIndex: BlocProvider.of<TeamBloc>(context).allTasksCycleIndex,
                      wichCycle: WichCycle.allTasksCycle));
            }break;
              case 2:{
                BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(
                    navIndex: BlocProvider.of<TeamBloc>(context).notificationCycleIndex,
                    wichCycle: WichCycle.notificationsCycle));
              }break;
              case 2:{
                BlocProvider.of<ProfileBloc>(context).add(GetUserCachedDataEvent());
              }break;


            }

          }
          );

        },
      ),
    );
  }

  Widget _buildBody() {
    int wichIndex=navIndex!=null?currentIndex=navIndex!:currentIndex;
    return IndexedStack(
      index: wichIndex,
      children: indexedWidget,
    );
  }
}
