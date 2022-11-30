import 'package:ad_samy/core/utils/errors.dart';
import 'package:dartz/dartz.dart';

import '../repository/auth-repository.dart';

class OTPUseCase{
  final AuthRepository authRepository;
  OTPUseCase({required this.authRepository});

  Future<Either<Failure,Unit>>call({required String otp }){
    return authRepository.otpVerification(otp);
  }
}