
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/strings/exception_description.dart';
import '../../../../../../core/utils/errors.dart';
import '../../data/data-source/client-projects-data-source.dart';
import '../../domain/use-cases/get-all-client-projects.dart';
import '../../domain/use-cases/get-client-data.dart';
import '../../domain/use-cases/get-client-projects-use-case.dart';
import 'client-event.dart';
import 'client-states.dart';


class ClientProjectBloc
    extends Bloc<ClientProjectsEvents, ClientProjectsStates> {
  int currentIndex = 0;

  String? clientToken;
  final List<int> _backstack = [0];
  final GetClientProjectsUseCase getClientProjectsUseCase;
  final GetClientDataUseCase getClientDataUseCase;
  final GetClientAllProjectsUseCase getClientAllProjectsUseCase;
  final ClientProjectsDataSource clientProjectsDataSource;
  ClientProjectBloc(
      {required this.getClientProjectsUseCase,
      required this.getClientDataUseCase,
      required this.clientProjectsDataSource,
      required this.getClientAllProjectsUseCase})
      : super(CPSInitState()) {
    on((event, emit) async {
      var x = await clientProjectsDataSource.getClientData();
      clientToken = x.user!.token;
      switch (event.runtimeType) {
        case GetAllClientProjectsEvent:
          {
            if (event is GetAllClientProjectsEvent) {
              navigateTo(0);
              emit(GetClientAllProjectStates(cpsProgressState: CPSProgressState.loading));
              final either = await getClientAllProjectsUseCase.call(
                  clientToken: x.user!.token!, clientId: x.user!.clientId!);
              either.fold((l) {
                emit(GetClientAllProjectStates(
                    cpsProgressState: CPSProgressState.failure,
                    errorMessage: _getErrorMessage(l)));
              }, (r) {
                emit(GetClientAllProjectStates(
                    cpsProgressState: CPSProgressState.success,
                    clientAllProjectsEntity: r,
                    loginEntity: x));
              });
            }
          }
          break;
        case GetClientProjectEvent:
          {
            if (event is GetClientProjectEvent) {
              navigateTo(event.index!);
               emit(GetClientProjectStates(cpsProgressState: CPSProgressState.loading));
              final either = await getClientProjectsUseCase.call(
                  projectId: event.projectId!, clientToken: x.user!.token!);
              either.fold((l) {
                emit(GetClientProjectStates(
                    cpsProgressState: CPSProgressState.failure,
                    errorMessage: _getErrorMessage(l)));
              }, (r) {
                emit(GetClientProjectStates(
                    cpsProgressState: CPSProgressState.success,
                    clientProjectEntity: r,
                    loginEntity: x));
              });
            }
          }
          break;

        case ProjectPopEvent:
          {
            if (event is ProjectPopEvent) {
              customPop(event.context!);
              emit(ClientPopState());
            }
          }
          break;
      }
    });
  }
  void navigateTo(int index) {
    _backstack.add(index);
    currentIndex = index;
  }

  void navigateBack(int index) {
    currentIndex = index;
    // print('currentIndexis$currentIndex');
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

  String _getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        {
          return SERVER_FAILURE_MESSAGE;
        }
      case OfflineFailure:
        {
          return OFFLINE_FAILURE_MESSAGE;
        }
      default:
        {
          return 'unexpected error ,please try again later .';
        }
    }
  }
}
