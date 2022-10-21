import 'package:ad_samy/features/team-projects/data/data-source/team-remote-data-source.dart';
import 'package:ad_samy/features/team-projects/domain/use-case/update-task-use-case.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors.dart';
import '../../../../core/strings/exception_description.dart';
import '../../domain/use-case/project-tasks-use-case.dart';
import '../../domain/use-case/team-all-projects-use-case.dart';
import '../../domain/use-case/team-overview-use-case.dart';
import '../../domain/use-case/team-task-details-use-case.dart';

class TeamBloc extends Bloc<TeamEvents,TeamStates>{
  String?teamToken;
  int currentIndex = 0;
  int ?projectId;
  final List<int> backstack = [0];
  final TeamOverViewUseCase teamOverViewUseCase;
  final TeamAllProjectsUseCase teamAllProjectsUseCase;
  final ProjectsTasksUseCase projectsTasksUseCase;
  final TeamTaskDetailsUseCase teamTaskDetailsUseCase;
  final TeamRemoteDataSource teamRemoteDataSource;
  final UpdateTaskUseCase updateTaskUseCase;
  TeamBloc({
    required this.teamOverViewUseCase,
    required this.teamAllProjectsUseCase,
    required this.projectsTasksUseCase,
    required this.teamTaskDetailsUseCase,
    required this.teamRemoteDataSource,
    required this.updateTaskUseCase
}):super(TeamInitialState()){
    on((event, emit)async {
      var x = await teamRemoteDataSource.getClientData();
      teamToken = x.user!.token;
   switch(event.runtimeType){
     case GetTeamOverViewEvents:{
       if(event is GetTeamOverViewEvents){
         emit(GetTeamOverViewState(
           teamStatesStatus: TeamStatesStatus.loading,
         ));
         final either=await teamOverViewUseCase.call(teamToken: teamToken);
         either.fold((l) {
           emit(GetTeamOverViewState(
             teamStatesStatus: TeamStatesStatus.failure,
             errorMessage: _getErrorMessage(l)
           ));
         }, (r) {
           emit(GetTeamOverViewState(
               teamStatesStatus: TeamStatesStatus.success,
               teamOverViewEntity: r
           ));
         });
       }
     }break;
     case GetTeamAllProjectsEvents:{
       if(event is GetTeamAllProjectsEvents){
         navigateTo(1);
         emit(GetTeamAllProjectsStates(
           teamStatesStatus: TeamStatesStatus.loading,
         ));
         final either=await teamAllProjectsUseCase.call(teamToken: teamToken);
         either.fold((l) {
           emit(GetTeamAllProjectsStates(
               teamStatesStatus: TeamStatesStatus.failure,
               errorMessage: _getErrorMessage(l)
           ));
         }, (r) {
           emit(GetTeamAllProjectsStates(
               teamStatesStatus: TeamStatesStatus.success,
               teamAllProjectsEntity: r
           ));
         });
       }
     }break;
     case GetTeamProjectTasksEvent:{
       if(event is GetTeamProjectTasksEvent){
         navigateTo(2);
         emit(GetTeamProjectTasksStates(
           teamStatesStatus: TeamStatesStatus.loading,
         ));
         final either=await projectsTasksUseCase.call(
             teamToken:teamToken,
             projectId: event.projectId);
         either.fold((l) {
           emit(GetTeamProjectTasksStates(
               teamStatesStatus: TeamStatesStatus.failure,
               errorMessage: _getErrorMessage(l)
           ));
         }, (r) {

           emit(GetTeamProjectTasksStates(
               teamStatesStatus: TeamStatesStatus.success,
               projectTasksEntity: r
           ));
         });
       }
     }break;
     case GetTeamTaskDetailsEvent:{
       if(event is GetTeamTaskDetailsEvent){
         navigateTo(event.navIndex!);
         emit(GetTeamTaskDetailsStates(
           teamStatesStatus: TeamStatesStatus.loading,
         ));
         final either=await teamTaskDetailsUseCase.call(
             teamToken:teamToken,
             taskId: event.taskId,
         );
         either.fold((l) {
           emit(GetTeamTaskDetailsStates(
               teamStatesStatus: TeamStatesStatus.failure,
               errorMessage: _getErrorMessage(l)
           ));

         }, (r) {
           emit(GetTeamTaskDetailsStates(
               teamStatesStatus: TeamStatesStatus.success,
               teamTaskDetailsEntity: r,

           ));
         });
       }
     }break;
     case UpdateTaskStatusEvent:{
       if(event is UpdateTaskStatusEvent){
         navigateTo(event.navIndex!);
         emit(GetTeamTaskDetailsStates(
           teamStatesStatus: TeamStatesStatus.loading,
         ));
         await updateTaskUseCase.call(teamToken:teamToken,
             taskId: event.taskId,status: event.status);
         final either=await teamTaskDetailsUseCase.call(
           teamToken:teamToken,
           taskId: event.taskId,
         );
         either.fold((l) {
           emit(GetTeamTaskDetailsStates(
               teamStatesStatus: TeamStatesStatus.failure,
               errorMessage: _getErrorMessage(l)
           ));

         }, (r) {
           emit(GetTeamTaskDetailsStates(
             teamStatesStatus: TeamStatesStatus.success,
             teamTaskDetailsEntity: r,

           ));
         });
       }
     }break;
     case PopEvent:{
       if(event is PopEvent){
         customPop(event.context!);
         emit(PopState());
       }
     }
   }
    });
  }
  void navigateTo(int index) {
    backstack.add(index);
    currentIndex = index;
  }

  void navigateBack(int index) {
    currentIndex = index;
    // print('currentIndexis$currentIndex');
  }

  Future<bool> customPop(BuildContext context) {
    if (backstack.length > 1) {
      backstack.removeAt(backstack.length - 1);
      navigateBack(backstack[backstack.length - 1]);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
  String _getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        {
          return SERVER_FAILURE_MESSAGE;
        }
      case OfflineFailure:
        {
          return OFFLINE_FAILURE_MESSAGE;
        }
      default:
        {
          return 'unexpected error ,please try again later .';
        }
    }
  }

}