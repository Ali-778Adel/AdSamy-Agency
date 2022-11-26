
import '../../domain/entities/user-cache-entity.dart';

abstract class ProfileStates{}

class PSInitState extends ProfileStates{}

enum PSProgressStatus{loading,failure,success}

enum PSProgressType{getUserData,deleteUserData}

class GetUserCachedDataState extends ProfileStates{
  final PSProgressType?psProgressType;
  final UserCacheEntity?userCacheEntity;
  final PSProgressStatus? psProgressStatus;
  final String?errorMessage;

  GetUserCachedDataState({this.psProgressStatus,this.userCacheEntity,this.errorMessage,this.psProgressType});

}