import 'package:equatable/equatable.dart';

class UserCacheEntity extends Equatable{
  final bool? success;
  final String ?message;
  final UserCacheEntityData ?user;

  const UserCacheEntity({ this.success, this.message, this.user});

  @override
  List<Object?> get props => [success,message,user];
}

class UserCacheEntityData extends Equatable{
  final int ?id;
  final int?clientId;
  final String ?email;
  final String ?name;
  final String ?phone;
  final String ?token;
  final String?type;

  const UserCacheEntityData({ this.id, this.clientId,this.email, this.name, this.phone, this.token,this.type});

  @override
  List<Object?> get props => [id,email,name,phone,token,clientId];}


