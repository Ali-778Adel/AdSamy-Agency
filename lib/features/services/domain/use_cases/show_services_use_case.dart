import 'package:ad_samy/features/services/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';
import '../entities/service_entity.dart';

class GetAllServicesUseCase {
  final Repository repository;
  GetAllServicesUseCase({required this.repository});

  Future<Either<Failure,ServiceEntity>> call() {
    return repository.showAllServices();
  }
}
