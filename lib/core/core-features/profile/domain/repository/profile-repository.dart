import 'package:dartz/dartz.dart';

import '../../../../utils/errors.dart';
import '../entities/user-cache-entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserCacheEntity>> getUserCachedData();
  Future<Either<Failure, bool>> deleteUserCachedData();
}
