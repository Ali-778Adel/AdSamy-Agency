import 'package:ad_samy/applications/lead-application/services/domain/entities/service-details-entity.dart';

enum ServiceDetailsRequestStatus { loading, failure, success }

class ShowServiceDetailsStates1 {
  final ServiceDetailsEntity ?serviceDetailsEntity;
  final ServiceDetailsRequestStatus? serviceDetailsRequestStatus;
  final String?erroMesasge;

  ShowServiceDetailsStates1(
      {
        this.serviceDetailsEntity,
        this.serviceDetailsRequestStatus=ServiceDetailsRequestStatus.loading,
        this.erroMesasge
      });

  ShowServiceDetailsStates1 copyWith(
      {
        final  ServiceDetailsEntity? serviceDetailsEntity,
        final ServiceDetailsRequestStatus? serviceDetailsRequestStatus,
        final String?errorMessage


      }) {
    return ShowServiceDetailsStates1(
        serviceDetailsEntity: serviceDetailsEntity,
        serviceDetailsRequestStatus: serviceDetailsRequestStatus,
        erroMesasge: erroMesasge

    );
  }
}
