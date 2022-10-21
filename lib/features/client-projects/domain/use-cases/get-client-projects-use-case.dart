import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors.dart';
import '../entities/project-entity.dart';
import '../repository/client-repository.dart';

class GetClientProjectsUseCase extends Equatable{
  final ClientProjectRepository clientProjectRepository;

  const GetClientProjectsUseCase({required this.clientProjectRepository});

 Future<Either<Failure,ClientProjectEntity>>call({required int projectId,required String clientToken}){
   return clientProjectRepository.getClientProject(projectId: projectId,clientToken: clientToken);
 }


  @override
  List<Object?> get props => [clientProjectRepository];

}