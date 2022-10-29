import 'package:ad_samy/features/profile/presentation/pages/profile-main-page.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/features/team-projects/presentation/pages/employee-main-pade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/team-projects/presentation/bloc/team-bloc.dart';
import '../../features/team-projects/presentation/pages/notification-demo.dart';
import '../../features/team-projects/presentation/pages/team-all-tasks.dart';
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
    const TeamAllTasks(),
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
              case 0:{
                BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents());
              }break;
              case 1:{
              BlocProvider.of<TeamBloc>(context).add(GetTeamAllTasksEvent());
            }break;
              case 2:{
                BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents());
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
