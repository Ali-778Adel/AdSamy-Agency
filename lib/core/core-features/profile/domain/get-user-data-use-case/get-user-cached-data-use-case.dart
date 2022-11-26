import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/errors.dart';
import '../entities/user-cache-entity.dart';
import '../repository/profile-repository.dart';

class GetUserProfileCachedDataUseCase extends Equatable{
  final  ProfileRepository profileRepository;
  const GetUserProfileCachedDataUseCase({required this.profileRepository});

  Future<Either<Failure,UserCacheEntity>>call(){
    return profileRepository.getUserCachedData();
  }

  @override
  List<Object?> get props => [profileRepository];
}