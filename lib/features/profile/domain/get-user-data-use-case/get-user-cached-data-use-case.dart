import 'package:ad_samy/features/profile/domain/entities/user-cache-entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors.dart';
import '../../../authentiacation/domain/entities/login-entity.dart';
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