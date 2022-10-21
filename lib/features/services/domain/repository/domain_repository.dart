import 'package:ad_samy/features/services/data/models/register-lead-model.dart';
import 'package:ad_samy/features/services/domain/entities/lead-form-entity.dart';
import 'package:ad_samy/features/services/domain/use_cases/send-lead-form-sue-case.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors.dart';
import '../entities/service-details-entity.dart';
import '../entities/service_entity.dart';

abstract class Repository{

 Future<Either<Failure,ServiceEntity>> showAllServices();

 Future<Either<Failure,ServiceDetailsEntity>>showServiceDetails({required int catId});

Future<Either<Failure,RegisterLeadEntity>>sendLeadData({required LeadFormParams leadFormParams});


}