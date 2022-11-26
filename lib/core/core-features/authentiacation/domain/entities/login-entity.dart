 import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
 final bool? success;
 final String ?message;
 final LoginUserEntity ?user;

  const LoginEntity({ this.success, this.message, this.user});

  @override
  List<Object?> get props => [success,message,user];
}

class LoginUserEntity extends Equatable{
  final int ?id;
  final int?clientId;
  final String ?email;
  final String ?name;
  final String ?phone;
  final String ?token;
  final String?type;

  const LoginUserEntity({ this.id, this.clientId,this.email, this.name, this.phone, this.token,this.type});

  @override
  List<Object?> get props => [id,email,name,phone,token,clientId];}


