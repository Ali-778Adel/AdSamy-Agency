
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';
import '../../../../../../core/resources/core-dimens.dart';
import '../../../../../../core/resources/palette.dart';
import '../bloc/team-bloc.dart';
import '../bloc/team-events.dart';
import '../bloc/team-states.dart';
import '../widgets/employee-page-header.dart';
import '../widgets/project-item.dart';
import '../widgets/task-item.dart';

class EmployeeMainPage extends StatelessWidget {
  const EmployeeMainPage({Key? key}) : super(key: key);

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
            if(state is GetTeamOverViewState){
              if(state.teamStatesStatus==TeamStatesStatus.success){
                return _buildBodyListView(context: context,state: state);
              }else if (state.teamStatesStatus==TeamStatesStatus.failure){
                return Center(child: Text('${state.errorMessage}',style: Theme.of(context).textTheme.bodyText1,),);
              }
            }
            return Shimmer.fromColors(
                        loop: 10,
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey[350]!,
                        enabled: true,
                        child: _buildShimmerBodyListView(context: context),);
                    }
      ),


    );
  }
  Widget _buildBodyListView({ BuildContext? context,GetTeamOverViewState?state}){
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const EmployeePageHeader(),
        _linearProgressIndicator(context: context,state:state ),
        _projectsListView(state: state),
        Padding(padding: const EdgeInsets.all(8.0),child: Text('Today Tasks',style: Theme.of(context!).textTheme.headline1,),),
        _tasksListView(context: context,state: state)


      ],
    );
  }

  Widget _buildShimmerBodyListView({ BuildContext? context,}){
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const EmployeePageHeader(),
        _linearProgressIndicator(context: context),
        _projectsListView(),
        _tasksListView()


      ],
    );
  }

  Widget _linearProgressIndicator({BuildContext ?context,GetTeamOverViewState ?state}){
    return     Padding(
      padding: const EdgeInsets.all(8.0),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: Text('Total Tasks',style: Theme.of(context!).textTheme.headline1,)),
          SpacerV(value: CoreDimens.subtitle2,),
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            backgroundColor: Palette.darkBlue,
            animation: true,
            animationDuration: 1000,
            lineHeight: CoreDimens.h7,
            trailing:  Text("${state!=null?(state.teamOverViewEntity!.teamOverViewEntityData!.activity!)/100:.2.toDouble()}"),
            percent:state!=null?(state.teamOverViewEntity!.teamOverViewEntityData!.activity!)/100:.2,
            // linearStrokeCap: LinearStr,
            progressColor: Palette.yellowPrimary,
          ),
          SpacerV(value: CoreDimens.h5,),
          Row(
            children: [
              Text('Projects',style: Theme.of(context).textTheme.headline1,),
              const Spacer(),
              TextButton(onPressed: (){
                BlocProvider.of<TeamBloc>(context).add(
                    GetTeamAllProjectsEvents(
                        navIndex: 1,
                        wichCycle: WichCycle.homeCycle
                    ));
              }, child: Text('view all',style: Theme.of(context).textTheme.bodyText1,))
            ],
          ),
          SpacerV(value: CoreDimens.h5,),
        ],
      ),
    );
  }

  Widget _projectsListView({GetTeamOverViewState?state}){
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount:state !=null?state.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects!.length:10 ,
              itemBuilder: (context,index){
                return  InkWell(
                  child: ProjectItem(
                    projectName: state !=null?state.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].projectTitle:'Crs',
                    taskCount:  state !=null?state.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].tasksCount:24,
                    taskProgress:state !=null?state.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].projectProgress!.toDouble()/100:.24 ,
                  ),
                  onTap: (){
                    BlocProvider
                        .of<TeamBloc>(context).projectId=state!.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].projectId;
                    BlocProvider.of<TeamBloc>(context).add(
                        GetTeamProjectTasksEvent(
                          wichCycle:WichCycle.homeCycle,
                          navIndex:2,
                          projectId:state.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].projectId,
                        ));
                  },
                );
              }),
        ),
      ],
    );
  }

  Widget _tasksListView({BuildContext ?context,GetTeamOverViewState?state}){
    if (state!=null&& state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks!.isEmpty){
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
            itemCount:state!=null? state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks!.length:0,
            // itemExtent: 40,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return  InkWell(
                child: TaskItem(
                  projectTitle:state!=null? state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks![index].projectTitle:'crm',
                  taskStartDate:state!=null?state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks![index].taskDateStart:'crm',
                  taskTitle:state!=null? state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks![index].taskTitle:'crm',
                ),
                onTap: (){
                  BlocProvider.of<TeamBloc>(context).add(
                      GetTeamTaskDetailsEvent(
                          wichCycle: WichCycle.homeCycle,
                          taskId:state!=null?
                          state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks![index].taskId
                              ??1:1,
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