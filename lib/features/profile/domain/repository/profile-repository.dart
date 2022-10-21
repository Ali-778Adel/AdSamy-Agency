import 'package:ad_samy/features/profile/domain/entities/user-cache-entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

abstract class ProfileRepository {

  Future<Either<Failure,UserCacheEntity>>getUserCachedData();
  Future<Either<Failure,bool>>deleteUserCachedData();
}