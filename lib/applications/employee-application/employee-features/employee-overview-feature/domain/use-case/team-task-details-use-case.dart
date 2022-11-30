import 'package:ad_samy/core/utils/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/team-task-details-entity.dart';
import '../repository/team-repository.dart';

class TeamTaskDetailsUseCase extends Equatable{
  final TeamRepository teamRepository;
  const TeamTaskDetailsUseCase({required this.teamRepository});

  Future<Either<Failure,TeamTaskDetailsEntity>>call({String?teamToken,int?taskId}){
    return teamRepository.getTaskDetails(teamToken: teamToken,taskId:taskId);
  }

  @override
  List<Object?> get props => [teamRepository];

}