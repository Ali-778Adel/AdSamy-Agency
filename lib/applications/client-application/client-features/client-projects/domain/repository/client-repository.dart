import 'package:dartz/dartz.dart';
import '../../../../../../core/core-features/authentiacation/domain/entities/login-entity.dart';
import '../../../../../../core/utils/errors.dart';
import '../entities/clint-all-projects-entity.dart';
import '../entities/project-entity.dart';

abstract class  ClientProjectRepository{
  Future<Either<Failure,ClientAllProjectsEntity>>getClientAllProject({required String clientToken,required int clientId});
  Future<Either<Failure,ClientProjectEntity>>getClientProject({required int projectId,required String clientToken});
  Future<Either<Failure,LoginEntity>>getClientCachedData();
}