import 'package:ad_samy/core/utils/errors.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/domain/entities/employee-all-tasks-entity.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/domain/entities/employee-task-details-entity.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/domain/repository/employee-all-tasks-repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/network/network-checker.dart';
import '../../../../../../core/utils/exceptions.dart';
import '../../domain/entities/update-employee-task-entity.dart';
import '../data-source/employee-all-tasks-data-source.dart';

class EmployeeAllTasksRepoitoryImpl implements EmployeeAlTasksRepository{
  final NetworkInfo networkInfo;
  final EmployeeAllTasksDataSource employeeAllTasksDataSource;
  EmployeeAllTasksRepoitoryImpl({required this.networkInfo,required this.employeeAllTasksDataSource});


  @override
  Future<Either<Failure, EmployeeTaskDetailsEntity>> getTaskDetails({String? teamToken, int? taskId})async {
    if (await networkInfo.isConnected){
      try{
        final response=await employeeAllTasksDataSource.getTeamTaskDetails(teamToken: teamToken,taskId: taskId);
        return Right(response);
      }on ServerErrorException{
        throw ServerErrorException();
      }
    }else{
      return Left(OfflineFailure());
    }

  }

  @override
  Future<Either<Failure, EmployeeAllTasksEntity>> getTeamAllTasks({String? teamToken})async {
    if(await networkInfo.isConnected){
      try{
        final response=await employeeAllTasksDataSource.getTeamAllTasks(teamToken: teamToken);
        return Right(response);
      }on ServerErrorException{
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, UpdateEmployeeTaskEntityy>> updateTaskStatus({String? teamToken, int? taskId, int? status})async {
    if(await networkInfo.isConnected){
      try{
        final response =await employeeAllTasksDataSource.updateTaskStatus(
          teamToken: teamToken,
          taskId: taskId,
          status: status,
        );
        return Right(response);
      }on ServerErrorException{
        throw ServerErrorException();
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}