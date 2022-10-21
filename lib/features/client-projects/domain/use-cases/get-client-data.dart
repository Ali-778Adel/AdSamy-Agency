import 'package:ad_samy/features/client-projects/domain/repository/client-repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors.dart';
import '../../../authentiacation/domain/entities/login-entity.dart';

class GetClientDataUseCase extends Equatable{
  final  ClientProjectRepository clientProjectRepository;
  const GetClientDataUseCase({required this.clientProjectRepository});

  Future<Either<Failure,LoginEntity>>call(){
    return clientProjectRepository.getClientCachedData();
  }

  @override
  List<Object?> get props => [clientProjectRepository];
}