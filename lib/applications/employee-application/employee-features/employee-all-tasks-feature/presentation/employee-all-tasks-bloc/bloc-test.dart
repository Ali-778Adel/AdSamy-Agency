import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/events.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use-cases/employee-task-details-use-case.dart';
import '../../domain/use-cases/update-employee-task-use-case.dart';

class BlocTest extends Bloc<EmployeeAllTasksEvents, EmployeeAllTasksStates> {
  final EmployeeTaskDetailsUseCase employeeTaskDetailsUseCase;
  final UpdateEmployeeTaskUseCase updateEmployeeTaskUseCase;
  BlocTest(
      {required this.updateEmployeeTaskUseCase,
      required this.employeeTaskDetailsUseCase})
      : super(EmployeeAllTasksInitState());

  @override
  Stream<EmployeeAllTasksStates> tryStrem(EmployeeAllTasksEvents event) async* {
    if (event is GetEmployeeTaskDetailsEvent) {
      yield (GetEmployeeTaskDetailsState(processStatus: ProcessStatus.loading));
      final either =
          await employeeTaskDetailsUseCase.call(taskId: event.taskId);
      either.fold((l) => {}, (r) async* {
        yield (GetEmployeeTaskDetailsState(
            processStatus: ProcessStatus.success,
            employeeTaskDetailsEntity: r

        ));
      });
    }
  }
}
