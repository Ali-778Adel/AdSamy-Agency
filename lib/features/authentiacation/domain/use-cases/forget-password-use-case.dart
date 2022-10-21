import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/forget-password-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/repository/auth-repository.dart';
import 'package:dartz/dartz.dart';
// class ConfirmPasswordUseCase{
//   final AuthRepository authRepository;
//
//   const ConfirmPasswordUseCase({required this.authRepository});
//   Future<Either<Failure,ConfirmPasswordEntity>>call(ConfirmPasswordParams confirmPasswordParams){
//     return authRepository.confirmPassword(confirmPasswordParams);
//   }
// }

class ConfirmPasswordParams{
final String email;
final String newPassword;

ConfirmPasswordParams({required  this.email,required this.newPassword});
}