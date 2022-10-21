import 'package:ad_samy/features/team-projects/domain/entities/team-all-projects.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-overview-entity.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-task-details-entity.dart';

import '../../domain/entities/project-tasks-entity.dart';

abstract class TeamStates{}

class TeamInitialState extends TeamStates{}
enum TeamStatesStatus{loading,failure,success}

class GetTeamOverViewState extends TeamStates{
 final TeamStatesStatus ?teamStatesStatus;
 final TeamOverViewEntity?teamOverViewEntity;
 final String?errorMessage;
 GetTeamOverViewState({
   this.teamStatesStatus,
   this.teamOverViewEntity,
   this.errorMessage
});
}

class GetTeamAllProjectsStates extends TeamStates{
  final TeamStatesStatus ?teamStatesStatus;
  final TeamAllProjectsEntity?teamAllProjectsEntity;
  final String?errorMessage;
  GetTeamAllProjectsStates({
    this.teamStatesStatus,
    this.teamAllProjectsEntity,
    this.errorMessage
  });
}

class GetTeamProjectTasksStates extends TeamStates {
  final TeamStatesStatus ?teamStatesStatus;
  final ProjectTasksEntity?projectTasksEntity;
  final String?errorMessage;

  GetTeamProjectTasksStates({
    this.teamStatesStatus,
    this.projectTasksEntity,
    this.errorMessage
  });

}

class GetTeamTaskDetailsStates extends TeamStates{
  final TeamStatesStatus ?teamStatesStatus;
  final TeamTaskDetailsEntity?teamTaskDetailsEntity;
  final String?errorMessage;
  final bool? updateTaskState;
  GetTeamTaskDetailsStates({
    this.teamStatesStatus,
    this.teamTaskDetailsEntity,
    this.errorMessage,
    this.updateTaskState,
  });

}

class UpdateTaskStatusStates extends TeamStates {
  final TeamStatesStatus ?teamStatesStatus;
  final String?errorMessage;

  UpdateTaskStatusStates({
    this.teamStatesStatus,
    this.errorMessage
  });

}

class PopState extends TeamStates{}