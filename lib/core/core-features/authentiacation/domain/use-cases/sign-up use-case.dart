
import 'package:dartz/dartz.dart';
import '../../../../utils/errors.dart';
import '../entities/sign-up-entity.dart';
import '../repository/auth-repository.dart';
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
