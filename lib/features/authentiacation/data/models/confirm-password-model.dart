import 'package:ad_samy/features/authentiacation/domain/entities/forget-password-entity.dart';

class ConfirmPasswordModel extends ConfirmPasswordEntity{

  const ConfirmPasswordModel({required String email,required String newPassword})
  :super(email: email,newPassword: newPassword);

  factory ConfirmPasswordModel.fromJson(Map<String,dynamic>json){
    return ConfirmPasswordModel(email: json['email'], newPassword: json['newPassword']);
  }

  Map<String,dynamic>toJson(){
   return {
     'email':email,
     'newPassword':newPassword
   };
  }
}