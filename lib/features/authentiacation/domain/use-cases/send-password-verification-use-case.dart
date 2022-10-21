import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/features/authentiacation/domain/repository/auth-repository.dart';
import 'package:dartz/dartz.dart';

class OTPUseCase{
  final AuthRepository authRepository;
  OTPUseCase({required this.authRepository});

  Future<Either<Failure,Unit>>call({required String otp }){
    return authRepository.otpVerification(otp);
  }
}