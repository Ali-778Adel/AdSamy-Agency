import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors.dart';
import '../repository/auth-repository.dart';

class CachingClientDataAuthUseCase extends Equatable{
 final  AuthRepository authRepository;
 const CachingClientDataAuthUseCase({required this.authRepository});

 Future<Either<Failure, Unit>>call(LoginEntity loginEntity){
   return authRepository.cachingUserAuthData(loginEntity);

 }

  @override
  List<Object?> get props => [authRepository];
}