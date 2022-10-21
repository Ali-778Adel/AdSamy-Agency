import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/core/exceptions.dart';
import 'package:ad_samy/features/team-projects/data/data-source/team-remote-data-source.dart';
import 'package:ad_samy/features/team-projects/domain/entities/project-tasks-entity.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-all-projects.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-overview-entity.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-task-details-entity.dart';
import 'package:ad_samy/features/team-projects/domain/repository/team-repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network-checker.dart';

class TeamRepositoryImpl implements TeamRepository{
  final TeamRemoteDataSource teamRemoteDataSource;
  final NetworkInfo networkInfo;
  TeamRepositoryImpl({required this.teamRemoteDataSource,required this.networkInfo});
  @override
  Future<Either<Failure, ProjectTasksEntity>>getProjectTasks({String? teamToken, int? projectId})async {
   if (await networkInfo.isConnected){
     try{
       final response=await teamRemoteDataSource.getTeamProjectTasks(teamToken: teamToken,projectId: projectId);
        return Right(response);
     }on ServerErrorException{
       throw ServerErrorException();
     }
   }else{
     return Left(OfflineFailure());
   }
  }

  @override
  Future<Either<Failure, TeamAllProjectsEntity>> getTeamAllProjects({String ?teamToken})async {
    if (await networkInfo.isConnected){
      try{
        final response=await teamRemoteDataSource.getTeamAllProjects(teamToken: teamToken);
        return Right(response);
      }on ServerErrorException{
        throw ServerErrorException();
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, TeamOverViewEntity>> getTeamOverView({String? teamToken})async {
    if (await networkInfo.isConnected){
      try{
        final response=await teamRemoteDataSource.getTeamOverView(teamToken: teamToken);
        return Right(response);
      }on ServerErrorException{
        throw ServerErrorException();
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, TeamTaskDetailsEntity>> getTaskDetails({String? teamToken, int? taskId}) async{
    if (await networkInfo.isConnected){
      try{
        final response=await teamRemoteDataSource.getTeamTaskDetails(teamToken: teamToken,taskId: taskId);
        return Right(response);
      }on ServerErrorException{
        throw ServerErrorException();
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTaskStatus({String?teamToken,int? taskId,int?status})async {
   if(await networkInfo.isConnected){
     try{
       final response =await teamRemoteDataSource.updateTaskStatus(
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