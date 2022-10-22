import 'package:ad_samy/features/authentiacation/presentation/widgets/spacer-v.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-bloc.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-states.dart';
import 'package:ad_samy/features/team-projects/presentation/pages/task-details.dart';
import 'package:ad_samy/features/team-projects/presentation/widgets/employee-page-header.dart';
import 'package:ad_samy/features/team-projects/presentation/widgets/project-item.dart';
import 'package:ad_samy/features/team-projects/presentation/widgets/task-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/core-dimens.dart';
import '../../../../core/resources/palette.dart';



class TeamAllTasks extends StatelessWidget{
  final List<Widget>_fragments=const [
    AllTasks(),
    TaskDetails()
  ];

  const  TeamAllTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc,TeamStates>(
        builder: (context, state) {
          int navIndex=BlocProvider.of<TeamBloc>(context).currentIndex;
          return WillPopScope(
              child: Scaffold(body: _fragments[0],),
              onWillPop: (){
                switch(navIndex){
                  case 1:{
                    BlocProvider.of<TeamBloc>(context).add(PopEvent(context: context));
                    return BlocProvider.of<TeamBloc>(context).customPop(context).then((value)async{
                      BlocProvider.of<TeamBloc>(context).add(GetTeamAllTasksEvent(navIndex: 0));
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

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

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
      child: BlocBuilder<TeamBloc,TeamStates>(
          builder: (context, state) {
            if(state is GetTeamAllTasksStates){
              switch(state.teamStatesStatus){
                case TeamStatesStatus.loading:{
                  return Shimmer.fromColors(
                    loop: 10,
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: _buildShimmerBodyListView(context: context),);
                }
                case TeamStatesStatus.failure:{
                  return  Center(child: Text('${state.errorMessage}'),);
                }
                case TeamStatesStatus.success:{
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
  Widget _buildBodyListView({ BuildContext? context,GetTeamAllTasksStates?state}){
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


  Widget _tasksListView({BuildContext ?context,GetTeamAllTasksStates?state}){
    if (state!=null&& state.teamAllTasksEntity!.teamAllTasksEntityData!.isEmpty){
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
            itemCount:state!=null? state.teamAllTasksEntity!.teamAllTasksEntityData!.length:0,
            // itemExtent: 40,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return  InkWell(
                child: TaskItem(
                  projectTitle:state!=null? state.teamAllTasksEntity!.teamAllTasksEntityData![index].projectTitle:'crm',
                  taskStartDate:state!=null?state.teamAllTasksEntity!.teamAllTasksEntityData![index].taskDateStart:'crm',
                  taskTitle:state!=null? state.teamAllTasksEntity!.teamAllTasksEntityData![index].taskTitle:'crm',
                ),
                onTap: (){
                  BlocProvider.of<TeamBloc>(context).add(
                      GetTeamTaskDetailsEvent(
                          taskId:state!=null? state.teamAllTasksEntity!.teamAllTasksEntityData![index].taskId??1:1,
                          navIndex: 3
                      ));
                },
              );
            }
        ),
      );
    }


  }



}
