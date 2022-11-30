import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/errors.dart';
import '../entities/login-entity.dart';
import '../repository/auth-repository.dart';

class CachingClientDataAuthUseCase extends Equatable {
  final AuthRepository authRepository;
  const CachingClientDataAuthUseCase({required this.authRepository});
  Future<Either<Failure, Unit>> call(LoginEntity loginEntity) {
    return authRepository.cachingUserAuthData(loginEntity);
  }

  @override
  List<Object?> get props => [authRepository];
}
