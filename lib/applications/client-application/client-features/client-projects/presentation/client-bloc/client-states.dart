import '../../../../../../core/core-features/authentiacation/domain/entities/login-entity.dart';
import '../../domain/entities/clint-all-projects-entity.dart';
import '../../domain/entities/project-entity.dart';

abstract class ClientProjectsStates {}

class CPSInitState extends ClientProjectsStates {}

enum CPSProgressState { loading, success, failure }

class GetClientProjectStates extends ClientProjectsStates {
  final CPSProgressState? cpsProgressState;
  final String? errorMessage;
  final ClientProjectEntity? clientProjectEntity;
  final LoginEntity? loginEntity;

  GetClientProjectStates({
    this.clientProjectEntity,
    this.errorMessage,
    this.cpsProgressState,
    this.loginEntity,
  });

  // GetClientProjectStates copyWith({
  //  CPSProgressState? cpsProgressState,
  //  String?errorMessage,
  //  ClientProjectEntity?clientProjectEntity,
  //  LoginEntity?loginEntity
  // }){
  //  return GetClientProjectStates(
  //      clientProjectEntity: clientProjectEntity,
  //      errorMessage: errorMessage,
  //      cpsProgressState: cpsProgressState,
  //      loginEntity: loginEntity
  //  );
  // }

}

class GetClientAllProjectStates extends ClientProjectsStates {
  final CPSProgressState? cpsProgressState;
  final String? errorMessage;
  final ClientAllProjectsEntity? clientAllProjectsEntity;
  final LoginEntity? loginEntity;

  GetClientAllProjectStates({
    this.clientAllProjectsEntity,
    this.errorMessage,
    this.cpsProgressState,
    this.loginEntity,
  });

  // GetClientAllProjectStates copyWith({
  //  CPSProgressState? cpsProgressState,
  //  String?errorMessage,
  //  ClientAllProjectsEntity?clientAllProjectsEntity,
  //  LoginEntity?loginEntity
  // }){
  //  return GetClientAllProjectStates(
  //      clientAllProjectsEntity: clientAllProjectsEntity,
  //      errorMessage: errorMessage,
  //      cpsProgressState: cpsProgressState,
  //      loginEntity: loginEntity
  //  );
  // }

}

class ClientPopState extends ClientProjectsStates {}
