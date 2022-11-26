import 'package:dartz/dartz.dart';
import '../../../../../../core/utils/errors.dart';
import '../entities/employee-all-tasks-entity.dart';
import '../repository/employee-all-tasks-repository.dart';


class EmployeeAllTasksUseCase{
  final EmployeeAlTasksRepository employeeAlTasksRepository;

 EmployeeAllTasksUseCase({required this.employeeAlTasksRepository});

 Future<Either<Failure,EmployeeAllTasksEntity>>call({String?teamToken}){
  return employeeAlTasksRepository.getTeamAllTasks(teamToken: teamToken) ;
 }
}