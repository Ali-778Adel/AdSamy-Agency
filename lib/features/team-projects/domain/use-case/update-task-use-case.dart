import 'package:ad_samy/features/team-projects/domain/repository/team-repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

class UpdateTaskUseCase{
  final TeamRepository teamRepository;

  UpdateTaskUseCase({required this.teamRepository});

  Future<Either<Failure,Unit>>call({String?teamToken,int?taskId,int?status}){
    return teamRepository.updateTaskStatus(teamToken: teamToken,taskId: taskId,status:status);
  }
}