
import '../../domain/entities/lead-form-entity.dart';

class RegisterLeadModel extends RegisterLeadEntity {
  const RegisterLeadModel({bool? status, String? message})
      : super(status: status, message: message);
  factory RegisterLeadModel.fromJson(Map<String, dynamic> json) {
    return RegisterLeadModel(status: json['status'], message: json['message']);
  }
}
