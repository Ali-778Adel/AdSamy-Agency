
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/domain/entities/employee-task-details-entity.dart';

import '../../domain/entities/employee-all-tasks-entity.dart';

abstract class EmployeeAllTasksStates {}

enum ProcessStatus { loading, failure, success }

class EmployeeAllTasksInitState extends EmployeeAllTasksStates{}

class GetEmployeeAllTasksState extends EmployeeAllTasksStates {
  final ProcessStatus? processStatus;
  final String? errorMessage;
  final EmployeeAllTasksEntity? employeeAllTasksEntity;

  GetEmployeeAllTasksState(
      {this.processStatus, this.employeeAllTasksEntity, this.errorMessage});
}

class GetEmployeeTaskDetailsState extends EmployeeAllTasksStates {
  final ProcessStatus? processStatus;
  final EmployeeTaskDetailsEntity? employeeTaskDetailsEntity;
  final String? errorMessage;
  GetEmployeeTaskDetailsState({
    this.employeeTaskDetailsEntity,
    this.processStatus,
    this.errorMessage,
  });
}
class UpdateEmployeeTaskStatusStates extends EmployeeAllTasksStates {
  final ProcessStatus ?processStatus;
  final String?errorMessage;

  UpdateEmployeeTaskStatusStates({
    this.processStatus,
    this.errorMessage
  });

}

class PopState extends EmployeeAllTasksStates{}