

import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/errors.dart';
import '../entities/project-tasks-entity.dart';
import '../entities/team-all-projects.dart';
import '../entities/team-overview-entity.dart';
import '../entities/team-task-details-entity.dart';
import '../entities/update-team-task-entity.dart';


abstract class TeamRepository{
  Future<Either<Failure,TeamOverViewEntity>>getTeamOverView({String?teamToken});
  Future<Either<Failure,TeamAllProjectsEntity>>getTeamAllProjects({String?teamToken});
  Future<Either<Failure,ProjectTasksEntity>>getProjectTasks({String?teamToken,int?projectId});
  Future<Either<Failure,TeamTaskDetailsEntity>>getTaskDetails({String?teamToken,int?taskId});
  Future<Either<Failure,UpdateEmployeeTaskEntity>>updateTaskStatus({String?teamToken,int?taskId,int?status});
}