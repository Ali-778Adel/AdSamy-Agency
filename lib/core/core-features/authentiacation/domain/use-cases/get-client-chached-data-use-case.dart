import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/errors.dart';
import '../entities/login-entity.dart';
import '../repository/auth-repository.dart';

class GetClientCachedDataUseCase extends Equatable{
  final  AuthRepository authRepository;
  const GetClientCachedDataUseCase({required this.authRepository});

  Future<Either<Failure,LoginEntity>>call(){
    return authRepository.getClientCachedData();
  }

  @override
  List<Object?> get props => [authRepository];
}