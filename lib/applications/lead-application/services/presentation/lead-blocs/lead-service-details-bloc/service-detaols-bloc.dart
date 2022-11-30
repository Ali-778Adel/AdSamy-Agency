import 'package:ad_samy/applications/lead-application/services/domain/use_cases/show-service-details-use-case.dart';
import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-service-details-bloc/service-details-events.dart';
import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-service-details-bloc/service-details-states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/error-function.dart';


class ServiceDetailsBloc extends Bloc<ShowServiceDetailsEvent1,ShowServiceDetailsStates1>{
  final ShowServiceDetailsUseCase showServiceDetailsUseCase;
  ServiceDetailsBloc({
    required this.showServiceDetailsUseCase
}):super(ShowServiceDetailsStates1()){
   on((event, emit)async {
    if(event is ShowServiceDetailsEvent1){
     emit(ShowServiceDetailsStates1().copyWith(
         serviceDetailsRequestStatus: ServiceDetailsRequestStatus.loading));

     final either=await  showServiceDetailsUseCase.call(catId: event.serviceId!);
     either.fold(
      (l) {
     emit(ShowServiceDetailsStates1().copyWith(
         serviceDetailsRequestStatus: ServiceDetailsRequestStatus.failure,
       errorMessage:Errors.getErrorMessage(l)
     ));
          },
      (r) {
        emit(ShowServiceDetailsStates1().copyWith(
            serviceDetailsRequestStatus: ServiceDetailsRequestStatus.success,
            serviceDetailsEntity: r
        ));
     }

     );

    }
   });
  }


}