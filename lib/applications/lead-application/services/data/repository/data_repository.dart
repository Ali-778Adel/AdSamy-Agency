import 'package:ad_samy/core/utils/exceptions.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/network/network-checker.dart';
import '../../../../../core/utils/errors.dart';
import '../../domain/entities/lead-form-entity.dart';
import '../../domain/entities/service-details-entity.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/repository/domain_repository.dart';
import '../../domain/use_cases/send-lead-form-sue-case.dart';
import '../data_source/services_data_source.dart';

class RepositoryImpl implements Repository{
 final ServicesDataSource servicesDataSource;
 final NetworkInfo networkInfo;
 RepositoryImpl({required this.servicesDataSource,required this.networkInfo});

  @override
  Future<Either<Failure,ServiceEntity>> showAllServices()async {
   if(await networkInfo.isConnected){
    try{
     final services=await servicesDataSource.showAllServices();
     return Right(services.toEntity());
    }on ServerErrorException {
    return Left(ServerFailure());
    }
   }else{
    return Left(OfflineFailure());
   }
  }

  @override
  Future<Either<Failure, ServiceDetailsEntity>> showServiceDetails({required int catId})async {
   if (await networkInfo.isConnected){
        try{
         final serviceDetails=  await servicesDataSource.showServiceDetails(catId: catId);
          return Right(serviceDetails);
        }on ServerErrorException{
         return Left(ServerFailure());
        }
    }else{
    return Left(OfflineFailure());
   }

  }

  @override
  Future<Either<Failure, RegisterLeadEntity>> sendLeadData(
      {required LeadFormParams leadFormParams})async {
    if(await networkInfo.isConnected){
        try{
         final req=await servicesDataSource.registerLead(leadFormParams: leadFormParams);
         return Right(req);
        } on ServerErrorException{
        return Left(ServerFailure());
        }
    }else{
    return Left(OfflineFailure());
    }

  }
}