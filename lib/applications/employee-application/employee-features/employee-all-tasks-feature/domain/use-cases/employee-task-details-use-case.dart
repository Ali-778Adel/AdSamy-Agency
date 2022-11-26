import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/domain/entities/employee-task-details-entity.dart';
import 'package:ad_samy/core/utils/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repository/employee-all-tasks-repository.dart';


class EmployeeTaskDetailsUseCase extends Equatable{
  final EmployeeAlTasksRepository employeeAlTasksRepository;
  const EmployeeTaskDetailsUseCase({required this.employeeAlTasksRepository});

  Future<Either<Failure,EmployeeTaskDetailsEntity>>call({String?teamToken,int?taskId}){
    return employeeAlTasksRepository.getTaskDetails(teamToken: teamToken,taskId:taskId);
  }

  @override
  List<Object?> get props => [employeeAlTasksRepository];

}