import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/errors.dart';
import '../entities/update-employee-task-entity.dart';
import '../repository/employee-all-tasks-repository.dart';

class UpdateEmployeeTaskUseCase{
  final EmployeeAlTasksRepository employeeAlTasksRepository;

  UpdateEmployeeTaskUseCase({required this.employeeAlTasksRepository});

  Future<Either<Failure,UpdateEmployeeTaskEntityy>>call({String?teamToken,int?taskId,int?status}){
    return employeeAlTasksRepository.updateTaskStatus(teamToken: teamToken,taskId: taskId,status:status);
  }
}