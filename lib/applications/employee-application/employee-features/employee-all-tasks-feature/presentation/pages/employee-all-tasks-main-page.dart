import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/bloc.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/events.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/states.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/widgets/task-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/resources/palette.dart';
import '../../../employee-overview-feature/presentation/widgets/employee-page-header.dart';


class EmployeeAllTasksMainPage extends StatelessWidget {
  const EmployeeAllTasksMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Palette.white,
      body: _buildBody(context),
    );
  }
  Widget _buildBody(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(8.0),
      child: BlocBuilder<EmployeeAllTasksBloc,EmployeeAllTasksStates>(
          builder: (context, state) {
            if(state is GetEmployeeAllTasksState){
              switch(state.processStatus){
                case ProcessStatus.loading:{
                  return Shimmer.fromColors(
                    loop: 10,
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: _buildShimmerBodyListView(context: context),);
                }
                case ProcessStatus.failure:{
                  return  Center(child: Text('${state.errorMessage}'),);
                }
                case ProcessStatus.success:{
                  return _buildBodyListView(context: context,state: state);
                }
                default:{

                }

              }
            }
            return const SizedBox(child: Center(child: Text('some thing went wrong ,try again later'),),);
          }
      ),


    );
  }
  Widget _buildBodyListView({ BuildContext? context,GetEmployeeAllTasksState?state}){
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const EmployeePageHeader(),
        Padding(padding: const EdgeInsets.all(8.0),child: Center(child: Text('Your Tasks',style: Theme.of(context!).textTheme.headline1,)),),
        _tasksListView(context: context,state: state)


      ],
    );
  }

  Widget _buildShimmerBodyListView({ BuildContext? context,}){
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const EmployeePageHeader(),
        _tasksListView()


      ],
    );
  }


  Widget _tasksListView({BuildContext ?context,GetEmployeeAllTasksState?state}){
    if (state!=null&& state.employeeAllTasksEntity!.teamAllTasksEntityData!.isEmpty){
      return  SizedBox(
        height: 400,
        child: Center(child: Text('you have no task today ,enjoy: ',style:Theme.of(context!).textTheme.headline1,)),
      );
    }else{
      return SizedBox(
        height: 400,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:state!=null? state.employeeAllTasksEntity!.teamAllTasksEntityData!.length:0,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return  InkWell(
                child: TaskItem(
                  projectTitle:state!=null? state.employeeAllTasksEntity!.teamAllTasksEntityData![index].projectTitle:'crm',
                  taskStartDate:state!=null?state.employeeAllTasksEntity!.teamAllTasksEntityData![index].taskDateStart:'crm',
                  taskTitle:state!=null? state.employeeAllTasksEntity!.teamAllTasksEntityData![index].taskTitle:'crm',
                ),
                onTap: (){
                  BlocProvider.of<EmployeeAllTasksBloc>(context).add(
                      GetEmployeeTaskDetailsEvent(
                          taskId: state!.employeeAllTasksEntity!.teamAllTasksEntityData![index].taskId??1,
                          navIndex:1
                      ));
                },
              );
            }
        ),
      );
    }


  }



}
