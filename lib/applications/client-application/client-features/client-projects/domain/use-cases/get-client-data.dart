import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/core-features/authentiacation/domain/entities/login-entity.dart';
import '../../../../../../core/utils/errors.dart';
import '../repository/client-repository.dart';


class GetClientDataUseCase extends Equatable{
  final  ClientProjectRepository clientProjectRepository;
  const GetClientDataUseCase({required this.clientProjectRepository});

  Future<Either<Failure,LoginEntity>>call(){
    return clientProjectRepository.getClientCachedData();
  }

  @override
  List<Object?> get props => [clientProjectRepository];
}