import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/bloc.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/states.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/pages/employee-all-tasks-task-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../employee-all-tasks-bloc/events.dart';
import 'employee-all-tasks-main-page.dart';

class EmployeeAllTasksController extends StatelessWidget{
  final List<Widget>_fragments= [
    EmployeeAllTasksMainPage(),
    EmployeeTaskDetails()
  ];

    EmployeeAllTasksController({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeAllTasksBloc,EmployeeAllTasksStates>(
        builder: (context, state) {
          int navIndex=BlocProvider.of<EmployeeAllTasksBloc>(context).currentIndex;
          return WillPopScope(
            child: Scaffold(body: _fragments[navIndex],),
            onWillPop: (){
              switch(navIndex){
                case 1:{
                  BlocProvider.of<EmployeeAllTasksBloc>(context).add(AllTasksPopEvent(context: context));
                  return BlocProvider.of<EmployeeAllTasksBloc>(context).customPop(context)
                      .then((value)async{
                        // Navigator.restorablePush(context, (context, arguments) =>MaterialPageRoute(builder: (context)=>EmployeeAllTasksMainPage()));
                    BlocProvider.of<EmployeeAllTasksBloc>(context).add(
                        GetEmployeeAllTasksEvent(
                        )
                    );
                    return Future.value(value);
                  });
                }
                default:{
                  return Future.value(true);
                }
              }
            },

          );
        }
    );
  }}