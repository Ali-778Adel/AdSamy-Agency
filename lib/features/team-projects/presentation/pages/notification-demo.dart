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



class EmployeeNotificationsPageNavigationController extends StatelessWidget{
  final List<Widget>_fragments=const [
    EmployeeMainPage(),
    TaskDetails()
  ];

  const  EmployeeNotificationsPageNavigationController({Key? key}) : super(key: key);
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
                      BlocProvider.of<TeamBloc>(context).add(GetTeamOverViewEvents(navIndex: 0));
                      return Future.value(value);
                    });
                  }
                  default:{
                    return Future.value(true);
                  }
                }
              });
        }
    );
  }}

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
            return const SizedBox();
          }
      ),


    );
  }
  Widget _buildBodyListView({ BuildContext? context,GetTeamOverViewState?state}){
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
                BlocProvider.of<TeamBloc>(context).add(GetTeamAllProjectsEvents(navIndex: 1));
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
                    BlocProvider.of<TeamBloc>(context).projectId=state!.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].projectId;
                    BlocProvider.of<TeamBloc>(context).add(
                        GetTeamProjectTasksEvent(
                          navIndex: 2,
                          projectId: state.teamOverViewEntity!.teamOverViewEntityData!.inprogressProjects![index].projectId,
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
        child: Center(child: Text('you have no notifications ',style:Theme.of(context!).textTheme.headline1,)),
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
                          taskId:state!=null? state.teamOverViewEntity!.teamOverViewEntityData!.todaysTasks![index].taskId??1:1,
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
