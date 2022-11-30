import '../../../../utils/errors.dart';
import '../entities/login-entity.dart';
import 'package:dartz/dartz.dart';

import '../repository/auth-repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  Future<Either<Failure, LoginEntity>> call(LoginParams loginParams) {
    return authRepository.login(loginParams);
  }
}

class LoginParams {
  final String type;
  final String email;
  final String password;

  LoginParams(
      {required this.email, required this.password, required this.type});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
