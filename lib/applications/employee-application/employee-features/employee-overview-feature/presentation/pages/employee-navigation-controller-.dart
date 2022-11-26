import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-bloc.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-events.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-states.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/pages/task-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all-employee-projects.dart';
import 'all-project-tasks.dart';
import 'employee-main-page.dart';


class EmployeeNavigationController extends StatelessWidget{
 final List<Widget>_fragments=const [
    EmployeeMainPage(),
    EmployeeAllProjects(),
    ProjectAllTasks(),
    TaskDetails()
  ];

const  EmployeeNavigationController({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return BlocBuilder<TeamBloc,TeamStates>(
    builder: (context, state) {
      int navIndex=BlocProvider.of<TeamBloc>(context).currentIndex;
      return WillPopScope(
          child: Scaffold(body: _fragments[navIndex],),
          onWillPop: (){
            switch(navIndex){
              case 1:{
                BlocProvider.of<TeamBloc>(context).add(PopEvent(context: context));
                return BlocProvider.of<TeamBloc>(context).customPop(context).then((value)async{
                  BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(
                      wichCycle: WichCycle.homeCycle,
                      teamOverViewEntity: GetTeamOverViewState().teamOverViewEntity!=null?GetTeamOverViewState().teamOverViewEntity:null,
                      navIndex: 0));
                  return Future.value(value);
                });
              }
              case 2:{
                if(BlocProvider.of<TeamBloc>(context).homeBackStack.length==2){
                  BlocProvider.of<TeamBloc>(context).add(PopEvent(context: context));

                  return BlocProvider.of<TeamBloc>(context).customPop(context).then((value)async{
                    BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(
                        wichCycle: WichCycle.homeCycle,
                        navIndex: 0));
                    return Future.value(value);
                  });
                }else{
                  BlocProvider.of<TeamBloc>(context).add(PopEvent(context: context));

                  return BlocProvider.of<TeamBloc>(context).customPop(context).then((value)async{
                    BlocProvider.of<TeamBloc>(context).add(GetTeamAllProjectsEvents(
                        wichCycle: WichCycle.homeCycle,
                        navIndex: 1));
                    return Future.value(value);
                  });
                }

              }
              case 3:{
                if(BlocProvider.of<TeamBloc>(context).homeBackStack.length==4||BlocProvider.of<TeamBloc>(context).homeBackStack.length==3){
                  BlocProvider.of<TeamBloc>(context).add(PopEvent(context: context));
                  return BlocProvider.of<TeamBloc>(context).customPop(context).then((value)async{
                    BlocProvider.of<TeamBloc>(context).add(GetTeamProjectTasksEvent(
                        wichCycle: WichCycle.homeCycle,
                        navIndex: 2,projectId: 4));
                    return Future.value(value);
                  });
                }else{
                  BlocProvider.of<TeamBloc>(context).add(PopEvent(context: context));
                  return BlocProvider.of<TeamBloc>(context).customPop(context).then((value)async{
                    BlocProvider.of<TeamBloc>(context).add(
                        GetTeamOverViewEvents(
                            wichCycle:WichCycle.homeCycle,
                            navIndex:0,
                        ));
                    return Future.value(value);
                  });
                }
              }
              default:{
                return Future.value(true);
            }
            }
      });
    }
  );
  }}


