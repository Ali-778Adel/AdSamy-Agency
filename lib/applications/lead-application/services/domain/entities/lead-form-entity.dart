import 'package:equatable/equatable.dart';

class RegisterLeadEntity extends Equatable{
  final bool ?status;
  final String? message;

  const RegisterLeadEntity({this.status,this.message});

  @override
  List<Object?> get props =>[status,message];
}

