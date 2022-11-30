
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/utils/errors.dart';
import '../entities/project-tasks-entity.dart';
import '../repository/team-repository.dart';

class ProjectsTasksUseCase extends Equatable{
  final TeamRepository teamRepository;
  const ProjectsTasksUseCase({required this.teamRepository});

  Future<Either<Failure,ProjectTasksEntity>>call({String?teamToken,int?projectId}){
    return teamRepository.getProjectTasks(teamToken: teamToken,projectId:projectId);
  }

  @override
  List<Object?> get props => [teamRepository];

}