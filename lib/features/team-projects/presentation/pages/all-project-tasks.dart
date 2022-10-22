import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-states.dart';
import 'package:ad_samy/features/team-projects/presentation/widgets/project-task-item.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/team-bloc.dart';

class ProjectAllTasks extends StatefulWidget {
  const ProjectAllTasks({Key? key}) : super(key: key);

  @override
  State<ProjectAllTasks> createState() => _ProjectAllTasksState();
}

class _ProjectAllTasksState extends State<ProjectAllTasks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Palette.white,
      body: _buildBody(context)
    );
  }
  Widget _buildBody(BuildContext context){
    return BlocBuilder<TeamBloc,TeamStates>(
      builder: (context, state) {
        if(state is GetTeamProjectTasksStates){
          switch(state.teamStatesStatus){
            case TeamStatesStatus.loading:{
              return const Center(child: CircularProgressIndicator(),);
                // Shimmer.fromColors(
                //   loop: 10,
                //   baseColor: Colors.grey,
                //   highlightColor: Colors.grey[100]!,
                //   enabled: true,
                //   child: _buildDynamicBody());
            }
            case TeamStatesStatus.failure:{
              return Center(child: Text(state.errorMessage??'some thing went wrong try again later'),);
            }
            case TeamStatesStatus.success:{
             return _buildDynamicBody(context:context,state:state);
            }
            default :{
              return const SizedBox();

            }
          }
        }
        return const SizedBox();
      }
    );
  }

  Widget _buildDynamicBody({BuildContext ?context,GetTeamProjectTasksStates? state}){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          // height: 2000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClayContainer(
                emboss: false,
                color: Colors.white,
                depth: 10,
                spread: 2,
                borderRadius: 25,
                child:CalendarDatePicker(lastDate: DateTime(2023), initialDate:DateTime.now(), onDateChanged: (DateTime value) {  }, firstDate: DateTime.now(),),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Text(state!=null? state.projectTasksEntity!.projectsTasksEntityData![0].projectTitle!:'Project Name',style: Theme.of(context!).textTheme.headline1,),
              ),
              Expanded(child:_buildTasksListView(context: context,states: state))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTasksListView({BuildContext ?context,GetTeamProjectTasksStates ?states}){
    if(states!=null&& states.projectTasksEntity!.projectsTasksEntityData!.isEmpty){
      return  Padding(
        padding:const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: Center(child: Text('No Tasks Assigned for this project yet',style:Theme.of(context!).textTheme.headline1,),),
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: ListView.builder(
              itemCount:states!=null? states.projectTasksEntity!.projectsTasksEntityData!.length:0,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return InkWell(
                  child: ProjectTaskItem(
                    taskTitle:states!=null? states.projectTasksEntity!.projectsTasksEntityData![index].taskTitle!:'No Task Added',
                    taskStartDate: states!=null? states.projectTasksEntity!.projectsTasksEntityData![index].taskDateStart!:'No Task Added',
                  ),
                  onTap: (){
                    BlocProvider.of<TeamBloc>(context).add(
                        GetTeamTaskDetailsEvent(
                        taskId:states!=null?states.projectTasksEntity!.projectsTasksEntityData![index].taskId:0
                        ,navIndex: 3,
                    ));
                  },
                );
              }),
        )  ,
      );
    }

}
}
