import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/features/authentiacation/data/models/sign-up-model.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/forget-password-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/sign-up-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/login-use-case.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/sign-up%20use-case.dart';
import 'package:dartz/dartz.dart';

import '../../data/repository/auth-repository-impl.dart';
abstract class AuthRepository{
  Future<Either<Failure,LoginEntity>>login(LoginParams loginParams);
  Future<Either<Failure,SignUpEntity>>signUp(SignUpParams signUpParams);
  Future<Either<Failure,Unit>>otpVerification(String otp);
  Future<Either<Failure,Unit>>cachingUserAuthData(LoginEntity loginEntity);
  Future<Either<Failure,LoginEntity>>getClientCachedData();
  Future<Either<Failure,Unit>>cachingEmployeeAuthData(LoginEntity loginEntity);
  // Future<Either<Failure,LoginEntity>>getEmployeeCachedData();
}