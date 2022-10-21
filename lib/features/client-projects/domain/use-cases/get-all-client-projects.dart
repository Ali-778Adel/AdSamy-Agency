import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors.dart';
import '../entities/clint-all-projects-entity.dart';
import '../repository/client-repository.dart';

class GetClientAllProjectsUseCase extends Equatable{
  final ClientProjectRepository clientProjectRepository;

  const GetClientAllProjectsUseCase({required this.clientProjectRepository});

  Future<Either<Failure,ClientAllProjectsEntity>>call({required String clientToken,required int clientId}){
    return clientProjectRepository.getClientAllProject(clientToken: clientToken, clientId:clientId);
  }


  @override
  List<Object?> get props => [clientProjectRepository];

}