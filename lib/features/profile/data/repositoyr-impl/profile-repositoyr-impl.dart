import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:ad_samy/features/profile/domain/entities/user-cache-entity.dart';
import 'package:ad_samy/features/profile/domain/repository/profile-repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions.dart';
import '../data-source/loacal-data-source.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileLocalDataSource profileLocalDataSource;
  ProfileRepositoryImpl({required this.profileLocalDataSource});
  @override
  Future<Either<Failure, UserCacheEntity>> getUserCachedData()async {
    try {
      final res = await profileLocalDataSource.getClientCachedData();
      return Right(res);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserCachedData() async{
    try {
      final res = await profileLocalDataSource.deleteUserCachedData();
      return Right(res);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }  }

}