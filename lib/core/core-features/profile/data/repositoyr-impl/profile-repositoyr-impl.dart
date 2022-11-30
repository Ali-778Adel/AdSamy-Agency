import 'package:ad_samy/core/utils/errors.dart';
import 'package:dartz/dartz.dart';
import '../../../../utils/exceptions.dart';
import '../../domain/entities/user-cache-entity.dart';
import '../../domain/repository/profile-repository.dart';
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