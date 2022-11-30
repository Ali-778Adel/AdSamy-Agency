import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/events.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/error-function.dart';
import '../../data/data-source/employee-all-tasks-data-source.dart';
import '../../domain/use-cases/employee-all-tasks-use-case.dart';
import '../../domain/use-cases/employee-task-details-use-case.dart';
import '../../domain/use-cases/update-employee-task-use-case.dart';


class EmployeeAllTasksBloc extends Bloc<EmployeeAllTasksEvents,EmployeeAllTasksStates>{
  int currentIndex = 0;
  String ?teamToken;
  final List<int> _backstack = [0];
  final EmployeeAllTasksDataSource employeeAllTasksDataSource;
  final EmployeeAllTasksUseCase employeeAllTasksUseCase;
  final EmployeeTaskDetailsUseCase employeeTaskDetailsUseCase;
  final UpdateEmployeeTaskUseCase updateEmployeeTaskUseCase;
  EmployeeAllTasksBloc({
    required this.employeeAllTasksUseCase,
    required this.employeeTaskDetailsUseCase,
    required this.updateEmployeeTaskUseCase,
    required this.employeeAllTasksDataSource,
  }):super(EmployeeAllTasksInitState()){
    on((event, emit)async {
      var x = await employeeAllTasksDataSource.getClientData();
      teamToken = x.user!.token!;
      switch(event.runtimeType){
        case GetEmployeeAllTasksEvent:{
          if(event is GetEmployeeAllTasksEvent){

            emit(GetEmployeeAllTasksState(
              processStatus: ProcessStatus.loading
            ));
            final either=await employeeAllTasksUseCase.call(teamToken: teamToken);
            either.fold((l) => {
              emit(GetEmployeeAllTasksState(
                processStatus: ProcessStatus.failure,
                errorMessage: Errors.getErrorMessage(l)
              ))
            }, (r) => {
              emit(GetEmployeeAllTasksState(
                  processStatus: ProcessStatus.success,
                  employeeAllTasksEntity: r))
            });
          }

        }break;
        case GetEmployeeTaskDetailsEvent:{
          if (event is GetEmployeeTaskDetailsEvent){
            navigateTo(event.navIndex!);
            this.onChange((Change<EmployeeAllTasksStates>(
                currentState:GetEmployeeTaskDetailsState(),
                nextState:UpdateEmployeeTaskStatusStates()  )));
            emit(GetEmployeeTaskDetailsState(
                processStatus: ProcessStatus.loading
            ));
            final either=await employeeTaskDetailsUseCase.call(teamToken: teamToken,taskId:event.taskId);
            either.fold((l) => {
              emit(GetEmployeeTaskDetailsState(
                  processStatus: ProcessStatus.failure,
                  errorMessage: Errors.getErrorMessage(l)
              ))
            }, (r) => {
              // tryStream(event)
              emit(GetEmployeeTaskDetailsState(
                  processStatus: ProcessStatus.success,
                  employeeTaskDetailsEntity: r))
            });
          }

        }break;
        case UpdateEmployeeTaskEvent:{
          if (event is UpdateEmployeeTaskEvent){
            emit(UpdateEmployeeTaskStatusStates(
              processStatus: ProcessStatus.loading
          ));
          final either=await updateEmployeeTaskUseCase.call(teamToken: teamToken,taskId: event.taskId,status:event.status);
          either.fold((l) => {
            emit(UpdateEmployeeTaskStatusStates(
                processStatus: ProcessStatus.failure,
                errorMessage: Errors.getErrorMessage(l)
            ))
          }, (r) => {
            emit(UpdateEmployeeTaskStatusStates(
              processStatus: ProcessStatus.success,
            )),

          });}

        }break;
        case AllTasksPopEvent:{
          if(event is AllTasksPopEvent){
            customPop(event.context!);
            emit(PopState());
          }
        }
      }
      @override
      Stream<EmployeeAllTasksStates> tryStream(GetEmployeeTaskDetailsEvent event) async* {
        emit( GetEmployeeTaskDetailsState(
            processStatus: ProcessStatus.success,
        ));
        final either =
        await employeeTaskDetailsUseCase.call(teamToken: teamToken,taskId: event.taskId);
        either.fold((l) => {},
                (r) async* {
              emit( GetEmployeeTaskDetailsState(
                  processStatus: ProcessStatus.success,
                  employeeTaskDetailsEntity: r

              ));
            });

      }
    });

  }




  void navigateTo(int index) {
    if(!_backstack.contains(index)){
      _backstack.add(index);
      currentIndex = index;
      print('bask stack length is ${_backstack.length}');

    }

  }

  void navigateBack(int index) {
    currentIndex = index;
  }

  Future<bool> customPop(BuildContext context) {
    if (_backstack.length > 1) {
      _backstack.removeAt(_backstack.length - 1);
      navigateBack(_backstack[_backstack.length - 1]);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

}