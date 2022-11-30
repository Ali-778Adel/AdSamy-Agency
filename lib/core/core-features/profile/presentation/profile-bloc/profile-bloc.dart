
import 'package:ad_samy/core/core-features/profile/presentation/profile-bloc/profile-events.dart';
import 'package:ad_samy/core/core-features/profile/presentation/profile-bloc/profile-states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../strings/exception_description.dart';
import '../../../../utils/errors.dart';
import '../../domain/get-user-data-use-case/delete-use-cached-use-case.dart';
import '../../domain/get-user-data-use-case/get-user-cached-data-use-case.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  final GetUserProfileCachedDataUseCase getUserProfileCachedDataUseCase;
  final DeleteUserCachedDataUseCase deleteUserCachedDataUseCase;
  ProfileBloc({
    required this.getUserProfileCachedDataUseCase,
    required this.deleteUserCachedDataUseCase,
  })
      : super(PSInitState()) {
    on((event, emit) async {
      switch (event.runtimeType) {
        case GetUserCachedDataEvent:
          {
            if (event is GetUserCachedDataEvent) {
              emit(GetUserCachedDataState(
                  psProgressType: PSProgressType.getUserData,
                  psProgressStatus: PSProgressStatus.loading));
              final either = await getUserProfileCachedDataUseCase.call();
              either.fold((l) {
                emit(
                  GetUserCachedDataState(
                      psProgressType: PSProgressType.getUserData,
                      psProgressStatus: PSProgressStatus.failure,
                      errorMessage:_getErrorMessage(l)),
                );
              }, (r) {
                emit(
                  GetUserCachedDataState(
                      psProgressType: PSProgressType.getUserData,
                      psProgressStatus:PSProgressStatus.success,
                      userCacheEntity: r),
                );
              });
            }
          }break;
        case DeleteUserCachedDataEvent:{
          if(event is DeleteUserCachedDataEvent){
            emit(GetUserCachedDataState(
                psProgressType: PSProgressType.deleteUserData,
                psProgressStatus: PSProgressStatus.loading));
            final either=await deleteUserCachedDataUseCase.call();
            either.fold((l) {
              emit(GetUserCachedDataState(
                  psProgressType: PSProgressType.deleteUserData,
                  psProgressStatus: PSProgressStatus.failure));
            }, (r) {
              emit(GetUserCachedDataState(
                  psProgressType: PSProgressType.deleteUserData,
                  psProgressStatus: PSProgressStatus.success));
            });
          }
        }
      }
    });
  }
  String _getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        {
          return OFFLINE_FAILURE_MESSAGE;
        }
      case ServerFailure:
        {
          return SERVER_FAILURE_MESSAGE;
        }
      case EmptyCacheFailure:
        {
          return EMPTY_CACHE_FAILURE_MESSAGE;
        }
      default:
        return 'un expected error,please try again later ';
    }
  }
}
