import 'package:ad_samy/core/utils/errors.dart';

import 'package:dartz/dartz.dart';

import '../entities/login-entity.dart';
import '../entities/sign-up-entity.dart';
import '../use-cases/login-use-case.dart';
import '../use-cases/sign-up use-case.dart';
abstract class AuthRepository{
  Future<Either<Failure,LoginEntity>>login(LoginParams loginParams);
  Future<Either<Failure,SignUpEntity>>signUp(SignUpParams signUpParams);
  Future<Either<Failure,Unit>>otpVerification(String otp);
  Future<Either<Failure,Unit>>cachingUserAuthData(LoginEntity loginEntity);
  Future<Either<Failure,LoginEntity>>getClientCachedData();
  Future<Either<Failure,Unit>>cachingEmployeeAuthData(LoginEntity loginEntity);
  // Future<Either<Failure,LoginEntity>>getEmployeeCachedData();
}