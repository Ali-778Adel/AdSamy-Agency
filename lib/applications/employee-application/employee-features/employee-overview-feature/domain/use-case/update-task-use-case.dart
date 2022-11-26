
import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/errors.dart';
import '../entities/update-team-task-entity.dart';
import '../repository/team-repository.dart';



class UpdateTaskUseCase{
  final TeamRepository teamRepository;

  UpdateTaskUseCase({required this.teamRepository});

  Future<Either<Failure,UpdateEmployeeTaskEntity>>call({String?teamToken,int?taskId,int?status}){
    return teamRepository.updateTaskStatus(teamToken: teamToken,taskId: taskId,status:status);
  }
}