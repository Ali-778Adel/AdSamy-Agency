import 'package:ad_samy/features/team-projects/domain/repository/team-repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors.dart';
import '../entities/team-task-details-entity.dart';

class TeamTaskDetailsUseCase extends Equatable{
  final TeamRepository teamRepository;
  const TeamTaskDetailsUseCase({required this.teamRepository});

  Future<Either<Failure,TeamTaskDetailsEntity>>call({String?teamToken,int?taskId}){
    return teamRepository.getTaskDetails(teamToken: teamToken,taskId:taskId);
  }

  @override
  List<Object?> get props => [teamRepository];

}