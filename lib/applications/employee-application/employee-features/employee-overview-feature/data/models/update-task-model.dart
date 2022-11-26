

import '../../domain/entities/update-team-task-entity.dart';

class UpdateTaskModel extends UpdateEmployeeTaskEntity{
  UpdateTaskModel({final bool?status,final String?message}):super(status: status,message:message);

  factory UpdateTaskModel.fromJson({
    required  Map<String,dynamic>json}){
    return UpdateTaskModel(
        status: json['status'],
        message: json['message']);
  }
}