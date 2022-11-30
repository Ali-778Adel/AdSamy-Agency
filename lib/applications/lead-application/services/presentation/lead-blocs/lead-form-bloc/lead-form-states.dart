

import 'package:ad_samy/applications/lead-application/services/domain/entities/lead-form-entity.dart';

enum LeadFormProgressStatus{loading,failure,success}


class LeadFormStates{
 final LeadFormProgressStatus ?leadFormProgressStatus;
 final String?errorMessage;
 final RegisterLeadEntity?registerLeadEntity;

 LeadFormStates({
   this.leadFormProgressStatus,
   this.errorMessage,
   this.registerLeadEntity
 });

  LeadFormStates copyWith({
  LeadFormProgressStatus ?leadFormProgressStatus,
  String?errorMessage,
  RegisterLeadEntity?registerLeadEntity,

}){
    return LeadFormStates(
      leadFormProgressStatus:leadFormProgressStatus,
      errorMessage: errorMessage,
      registerLeadEntity: registerLeadEntity
    );
  }
}