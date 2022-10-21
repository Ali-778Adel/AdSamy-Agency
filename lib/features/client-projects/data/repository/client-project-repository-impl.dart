import 'package:ad_samy/core/errors.dart';
import 'package:ad_samy/core/exceptions.dart';
import 'package:ad_samy/core/network/network-checker.dart';
import 'package:ad_samy/features/client-projects/domain/entities/clint-all-projects-entity.dart';
import 'package:ad_samy/features/client-projects/domain/entities/project-entity.dart';
import 'package:dartz/dartz.dart';
import '../../../authentiacation/domain/entities/login-entity.dart';
import '../../domain/repository/client-repository.dart';
import '../data-source/client-projects-data-source.dart';

class ClientProjectRepositoryImpl implements ClientProjectRepository {
  final NetworkInfo networkInfo;
  final ClientProjectsDataSource clientProjectsDataSource;
  ClientProjectRepositoryImpl(
      {required this.networkInfo, required this.clientProjectsDataSource});
  @override
  Future<Either<Failure, ClientProjectEntity>> getClientProject({required int projectId,required String clientToken}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await clientProjectsDataSource.getClientProject(clientId: projectId,clientToken: clientToken);
        return Right(res.toEntity());
      } on ServerErrorException {
        return Left(ServerFailure());
      }
    } else {
      return (Left(OfflineFailure()));
    }
  }
  @override
  Future<Either<Failure, LoginEntity>> getClientCachedData()async {
    try{
      final res= await clientProjectsDataSource.getClientData();
      return Right(res);
    }on EmptyCacheException{
      return Left(EmptyCacheFailure());

    }

  }

  @override
  Future<Either<Failure, ClientAllProjectsEntity>> getClientAllProject({required String clientToken,required int clientId})async {
    if (await networkInfo.isConnected) {
      try {
        final res = await clientProjectsDataSource.getClientAllProject(clientToken: clientToken,clientId: clientId);
        return Right(res.toEntity());
      } on ServerErrorException {
        return Left(ServerFailure());
      }
    } else {
      return (Left(OfflineFailure()));
    }
  }
}
