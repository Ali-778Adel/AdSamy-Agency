import 'package:equatable/equatable.dart';

import '../../domain/entities/lead-form-entity.dart';
import '../../domain/entities/service-details-entity.dart';
import '../../domain/entities/service_entity.dart';

abstract class ServicesStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends ServicesStates {
  @override
  List<Object?> get props => [];
}

enum ShowAllServicesStatus { success, failure, loading }

class ShowAllServicesStates extends ServicesStates {
  final ShowAllServicesStatus? showAllServicesStatus;
  final String? errorMessage;
  final String? successMessage;
  final ServiceEntity? serviceEntity;

  ShowAllServicesStates(
      {this.showAllServicesStatus,
      this.errorMessage,
      this.successMessage,
      this.serviceEntity});

  ShowAllServicesStates copyWith(
      {ShowAllServicesStatus? showAllServicesStatus,
      String? errorMessage,
      String? successMessage,
      ServiceEntity? serviceEntity}) {
    return ShowAllServicesStates(
      showAllServicesStatus: showAllServicesStatus,
      errorMessage: errorMessage,
      successMessage: successMessage,
      serviceEntity: serviceEntity,
    );
  }

  @override
  List<Object?> get props =>
      [showAllServicesStatus, errorMessage, successMessage, serviceEntity];
}

class ShowServiceDetailsStates extends ServicesStates {
  final ServiceDetailsEntity? serviceDetailsEntity;
  final ShowAllServicesStatus? showAllServicesStatus;
  final String? errorMessage;
  ShowServiceDetailsStates(
      {this.serviceDetailsEntity,
      this.showAllServicesStatus,
      this.errorMessage});

  ShowServiceDetailsStates copyWith({
    ShowAllServicesStatus? showAllServicesStatus,
    ServiceDetailsEntity? serviceDetailsEntity,
    String? errorMessage,
  }) {
    return ShowServiceDetailsStates(
      serviceDetailsEntity: serviceDetailsEntity,
      showAllServicesStatus: showAllServicesStatus,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [serviceDetailsEntity, showAllServicesStatus];
}

class ShowLeadingFormState extends ServicesStates {}

class RegisterLeadFormStates extends ServicesStates {
  final ShowAllServicesStatus? showAllServicesStatus;
  final RegisterLeadEntity ?registerLeadEntity;
  final  String? categoryId;
  final String?errorMessage;

  RegisterLeadFormStates(
      {this.showAllServicesStatus,this.registerLeadEntity,
        this.categoryId,
        this.errorMessage
      });

  RegisterLeadFormStates copyWith(
      {ShowAllServicesStatus? showAllServicesStatus,
       RegisterLeadEntity?registerLeadEntity
      }) {
    return RegisterLeadFormStates(
        showAllServicesStatus: showAllServicesStatus,
        registerLeadEntity: registerLeadEntity
     );
  }

  @override
  List<Object?> get props => [showAllServicesStatus, registerLeadEntity];
}

class OrderSuccessState extends ServicesStates{}

class PopState extends ServicesStates {}
