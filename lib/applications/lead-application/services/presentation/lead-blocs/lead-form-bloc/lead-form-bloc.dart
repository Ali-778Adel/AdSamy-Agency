import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-form-bloc/lead-form-events.dart';
import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-form-bloc/lead-form-states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/error-function.dart';
import '../../../domain/use_cases/send-lead-form-sue-case.dart';

class LeadFormBloc extends Bloc<LeadFormEvents,LeadFormStates>{
  final RegisterLeadFormUseCase registerLeadFormUseCase;
  LeadFormBloc({
    required this.registerLeadFormUseCase}):super(LeadFormStates()){
   on((event, emit) async {
      if(event is LeadFormEvents){
        emit(LeadFormStates().copyWith(
          leadFormProgressStatus: LeadFormProgressStatus.loading
        ));
        final either=await registerLeadFormUseCase.call(leadFormParams:event.leadFormParams!);
        either.fold((l) {
          emit(LeadFormStates().copyWith(
              leadFormProgressStatus: LeadFormProgressStatus.failure,
            errorMessage: Errors.getErrorMessage(l)
          ))  ;
        }, (r){
          emit(LeadFormStates().copyWith(
              leadFormProgressStatus: LeadFormProgressStatus.success,
            registerLeadEntity: r
          ));
        });

      }
    });
  }

}