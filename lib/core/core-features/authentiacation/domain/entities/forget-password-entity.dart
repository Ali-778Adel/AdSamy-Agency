import 'package:equatable/equatable.dart';

class ConfirmPasswordEntity extends Equatable{
  final String email;
  final String newPassword;

  const ConfirmPasswordEntity({required this.email,required this.newPassword});

  @override
  // TODO: implement props
  List<Object?> get props => [email,newPassword];

}