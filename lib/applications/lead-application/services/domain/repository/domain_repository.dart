
import 'package:dartz/dartz.dart';
import '../../../../../core/utils/errors.dart';
import '../entities/lead-form-entity.dart';
import '../entities/service-details-entity.dart';
import '../entities/service_entity.dart';
import '../use_cases/send-lead-form-sue-case.dart';

abstract class Repository{

 Future<Either<Failure,ServiceEntity>> showAllServices();

 Future<Either<Failure,ServiceDetailsEntity>>showServiceDetails({required int catId});

Future<Either<Failure,RegisterLeadEntity>>sendLeadData({required LeadFormParams leadFormParams});


}