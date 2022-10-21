import 'package:ad_samy/features/team-projects/domain/entities/project-tasks-entity.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-all-projects.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-overview-entity.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-task-details-entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

abstract class TeamRepository{
  Future<Either<Failure,TeamOverViewEntity>>getTeamOverView({String?teamToken});
  Future<Either<Failure,TeamAllProjectsEntity>>getTeamAllProjects({String?teamToken});
  Future<Either<Failure,ProjectTasksEntity>>getProjectTasks({String?teamToken,int?projectId});
  Future<Either<Failure,TeamTaskDetailsEntity>>getTaskDetails({String?teamToken,int?taskId});
  Future<Either<Failure,Unit>>updateTaskStatus({String?teamToken,int?taskId,int?status});
}