import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/errors.dart';
import '../entities/service-details-entity.dart';
import '../repository/domain_repository.dart';

class ShowServiceDetailsUseCase extends Equatable{
  final Repository repository;

  const ShowServiceDetailsUseCase({required this.repository});

  Future<Either<Failure,ServiceDetailsEntity>>call({required  int catId}){
    return repository.showServiceDetails(catId: catId);
  }
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}