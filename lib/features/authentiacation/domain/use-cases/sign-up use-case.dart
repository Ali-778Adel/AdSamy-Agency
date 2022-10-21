import 'package:ad_samy/features/authentiacation/data/models/sign-up-model.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/sign-up-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/repository/auth-repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';
import '../../data/repository/auth-repository-impl.dart';
class SignUpUseCase{
  AuthRepository authRepository;
  SignUpUseCase({required this.authRepository});
  Future<Either<Failure,SignUpEntity>>call(SignUpParams signUpParams){
    return authRepository.signUp(signUpParams);

  }
}

class SignUpParams{
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

const SignUpParams({
  required this.name,
  required this.email,
  required this.phoneNumber,
  required this.password
});

Map<String,dynamic>toJson(){
  return {
    'name':name,
    'email':email,
    'password':password,
    'phone':phoneNumber,

  };
}
}
