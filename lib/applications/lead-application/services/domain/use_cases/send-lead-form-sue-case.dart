
import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors.dart';
import '../entities/lead-form-entity.dart';
import '../repository/domain_repository.dart';

class RegisterLeadFormUseCase {

  final Repository repository;

  const RegisterLeadFormUseCase({required this.repository});

  Future<Either<Failure,RegisterLeadEntity>>call({required LeadFormParams leadFormParams}){
    return repository.sendLeadData(leadFormParams: leadFormParams);
  }


}

class LeadFormParams {
 final  String leadCategoryId;
 final String firstName;
 final String lastName;
 final String companyName;
 final String phone;
 final String email;
 final String description;
 final String value;


 const LeadFormParams({
   required  this.leadCategoryId,
   required this.firstName,
   required this.lastName,
   required this.companyName,
   required this.phone,
   required this.email,
   required this.description,
   required this.value});


 Map<String,dynamic>toJsonn(){
   return {
     'lead_categoryid':leadCategoryId,
     "lead_firstname": firstName,
     "lead_lastname": lastName,
     "lead_company_name":companyName,
     "lead_description":description,
     "lead_email":email,
     "lead_value":value,
     "lead_phone":phone,
   };
 }

}