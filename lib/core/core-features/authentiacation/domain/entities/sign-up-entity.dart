// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable{
  final bool ?status;
  final String ?message;
  final EntityData ? data;

 const SignUpEntity({ this.status, this.message, this.data});

  @override
  List<Object?> get props => [status,message,data];
}

class EntityData extends Equatable{
  final int ?id ;
  final String?name;
  final String?email;
  final String?phone;
  final String?imageUrl;
  final String?token;

  const EntityData({this.id,this.name,this.email,this.phone,this.imageUrl,this.token});

  @override
  List<Object?> get props => [id,email,phone,name,imageUrl,token];
}