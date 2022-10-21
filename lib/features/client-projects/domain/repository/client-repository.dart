import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';
import '../../../authentiacation/domain/entities/login-entity.dart';
import '../entities/clint-all-projects-entity.dart';
import '../entities/project-entity.dart';

abstract class  ClientProjectRepository{
  Future<Either<Failure,ClientAllProjectsEntity>>getClientAllProject({required String clientToken,required int clientId});
  Future<Either<Failure,ClientProjectEntity>>getClientProject({required int projectId,required String clientToken});
  Future<Either<Failure,LoginEntity>>getClientCachedData();
}