import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/core/exceptions.dart';
import 'package:ad_samy/core/network/network-checker.dart';
import 'package:ad_samy/features/authentiacation/data/data-source/auth-local-data-source.dart';
import 'package:ad_samy/features/authentiacation/data/models/confirm-password-model.dart';
import 'package:ad_samy/features/authentiacation/data/models/login-model.dart';
import 'package:ad_samy/features/authentiacation/data/models/sign-up-model.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/forget-password-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:ad_samy/features/authentiacation/domain/repository/auth-repository.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/login-use-case.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/sign-up%20use-case.dart';
import 'package:dartz/dartz.dart';
import '../data-source/auth-data-source.dart';

typedef SignInOrSignUpOrConfirmPassword = Future<Unit>;

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthDataSource authDataSource;
  final LocalDataSource localDataSource;

  const AuthRepositoryImpl(
      {required this.networkInfo,
      required this.authDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authDataSource.login(loginParams);
          await localDataSource.cachingClientAuthData(response);
        return Right(response);
      } on ServerErrorException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, SignUpModel>> signUp(SignUpParams signUpParams) async {
    if (await networkInfo.isConnected) {
      final response = await authDataSource.signUp(signUpParams);
      return Right(response);
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, Unit>> confirmPassword(
      ConfirmPasswordEntity confirmPasswordEntity) {
    ConfirmPasswordModel confirmPasswordModel = ConfirmPasswordModel(
        email: confirmPasswordEntity.email,
        newPassword: confirmPasswordEntity.newPassword);
    return _getMessage(authDataSource.confirmPassword(confirmPasswordModel));
  }

  @override
  Future<Either<Failure, Unit>> otpVerification(String otp) {
    return _getMessage(authDataSource.verifyOtp());
  }

  Future<Either<Failure, Unit>> _getMessage(
      SignInOrSignUpOrConfirmPassword signInOrSignUpOrConfirmPassword) async {
    if (await networkInfo.isConnected) {
      final response = await signInOrSignUpOrConfirmPassword;
      return Right(response);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cachingUserAuthData(
      LoginEntity loginEntity) async {
    LoginModel loginModel = const LoginModel();
    await localDataSource.cachingClientAuthData(loginModel);
    return const Right(unit);
  }

  @override
  Future<Either<Failure, LoginEntity>> getClientCachedData() async {
    try {
      final res = await localDataSource.getClientAuthCachedData();
      return Right(res);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cachingEmployeeAuthData(
      LoginEntity loginEntity) async {
    LoginModel loginModel = const LoginModel();
    await localDataSource.cachingEmployeeAuthData(loginModel);
    return const Right(unit);
  }

  // @override
  // Future<Either<Failure, LoginEntity>> getEmployeeCachedData() async {
  //   try {
  //     final res = await localDataSource.getEmployeeAuthCachedData();
  //     return Right(res);
  //   } on EmptyCacheException {
  //     return Left(EmptyCacheFailure());
  //   }
  // }
}
