
import 'package:equatable/equatable.dart';

import '../../domain/use-cases/login-use-case.dart';
import '../../domain/use-cases/sign-up use-case.dart';

class AuthEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvents {
  final LoginParams loginParams;
  LoginEvent({required this.loginParams});
  @override
  List<Object?> get props => [loginParams];
}

class SignUpEvent extends AuthEvents {
  final SignUpParams signUpParams;
  SignUpEvent({required this.signUpParams});

  @override
  List<Object?> get props => [signUpParams];
}

class ConfirmPasswordEvent extends AuthEvents {
  @override
  List<Object?> get props => [];
}

class VerifyOtpEvent extends AuthEvents {
  @override
  List<Object?> get props => [];
}

class GetAuthCachedDataEvent extends AuthEvents{

  @override
  List<Object?> get props => [];

}
