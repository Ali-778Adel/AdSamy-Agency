import 'package:dartz/dartz.dart';
import '../../../../../core/utils/errors.dart';
import '../entities/service_entity.dart';
import '../repository/domain_repository.dart';

class GetAllServicesUseCase {
  final Repository repository;
  GetAllServicesUseCase({required this.repository});

  Future<Either<Failure,ServiceEntity>> call() {
    return repository.showAllServices();
  }
}
