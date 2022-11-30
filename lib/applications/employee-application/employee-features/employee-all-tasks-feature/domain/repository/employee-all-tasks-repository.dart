import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/domain/entities/employee-task-details-entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/errors.dart';
import '../entities/employee-all-tasks-entity.dart';
import '../entities/update-employee-task-entity.dart';


abstract class EmployeeAlTasksRepository{

  Future<Either<Failure,EmployeeAllTasksEntity>>getTeamAllTasks({String?teamToken});
  Future<Either<Failure, EmployeeTaskDetailsEntity>>getTaskDetails({String?teamToken,int?taskId});
  Future<Either<Failure,UpdateEmployeeTaskEntityy>>updateTaskStatus({String?teamToken,int?taskId,int?status});

}