
import '../../domain/entities/update-employee-task-entity.dart';

class UpdateEmployeeTaskModel extends UpdateEmployeeTaskEntityy{
  UpdateEmployeeTaskModel({final bool?status,final String?message}):super(status: status,message:message);

  factory UpdateEmployeeTaskModel.fromJson({
    required  Map<String,dynamic>json}){
    return UpdateEmployeeTaskModel(
        status: json['status'],
        message: json['message']);
  }
}