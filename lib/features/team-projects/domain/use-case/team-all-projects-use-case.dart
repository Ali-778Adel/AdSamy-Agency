import 'package:ad_samy/features/team-projects/domain/entities/team-all-projects.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors.dart';
import '../repository/team-repository.dart';

class TeamAllProjectsUseCase extends Equatable{
  final TeamRepository teamRepository;
  const TeamAllProjectsUseCase({required this.teamRepository});

  Future<Either<Failure,TeamAllProjectsEntity>>call({String?teamToken}){
    return teamRepository.getTeamAllProjects(teamToken: teamToken);
  }

  @override
  List<Object?> get props => [teamRepository];

}