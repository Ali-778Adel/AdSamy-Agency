import 'package:ad_samy/features/team-projects/domain/entities/team-all-tasks-entity.dart';
import 'package:ad_samy/features/team-projects/domain/repository/team-repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

class TeamAllTasksUseCase{
  final TeamRepository teamRepository;
 TeamAllTasksUseCase({required this.teamRepository});

 Future<Either<Failure,TeamAllTasksEntity>>call({String?teamToken}){
  return teamRepository.getTeamAllTasks(teamToken: teamToken) ;
 }
}