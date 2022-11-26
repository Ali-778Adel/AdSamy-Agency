import 'package:ad_samy/core/strings/exception_description.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/errors.dart';
import '../../domain/use-cases/get-client-chached-data-use-case.dart';
import '../../domain/use-cases/login-use-case.dart';
import '../../domain/use-cases/send-password-verification-use-case.dart';
import '../../domain/use-cases/sign-up use-case.dart';
import 'auth-events.dart';
import 'auth-states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  // final ConfirmPasswordUseCase confirmPasswordUseCase;
  final OTPUseCase otpUseCase;
  final GetClientCachedDataUseCase getClientCachedDataUseCase;

  AuthBloc({
    required this.signUpUseCase,
    required this.loginUseCase,
    required this.otpUseCase,
    required this.getClientCachedDataUseCase,
    // required this.confirmPasswordUseCase,
  }) : super(const AuthState()) {
    on<AuthEvents>((event, emit) async {
      if (event is SignUpEvent) {
        emit(state.copyWith(
            progressStatus: ProgressStatus.loading,
            progressType: ProgressType.signUp));
        final either = await signUpUseCase(event.signUpParams);
        either.fold((failure) {
          emit(state.copyWith(
              progressStatus: ProgressStatus.failure,
              progressType: ProgressType.signUp,
              errorMessage: _getErrorMessage(failure)));
        }, (r) {
          emit(state.copyWith(
              progressStatus: ProgressStatus.success,
              progressType: ProgressType.signUp,
              progressEntity: r));
        });
      } else if (event is LoginEvent) {
        emit(state.copyWith(
            progressType: ProgressType.login,
            progressStatus: ProgressStatus.loading));
        final either = await loginUseCase.call(event.loginParams);
        either.fold((l) {
          emit(state.copyWith(
              progressType: ProgressType.login,
              progressStatus: ProgressStatus.failure,
              errorMessage: _getErrorMessage(l)));
        }, (r) {
          emit(state.copyWith(
              progressType: ProgressType.login,
              progressStatus: ProgressStatus.success,
              progressEntity: r));
        });
      } else if (event is GetAuthCachedDataEvent) {
        emit(
            state.copyWith(
            progressType: ProgressType.getCachedData,
            progressStatus: ProgressStatus.loading));
        final either= await getClientCachedDataUseCase();
        either.fold((l) {
          emit(
              state.copyWith(
              progressType: ProgressType.getCachedData,
              progressStatus: ProgressStatus.failure,
              errorMessage: _getErrorMessage(l)));
        }, (r) {
          emit(
              state.copyWith(
              progressType: ProgressType.getCachedData,
              progressStatus: ProgressStatus.success,
              progressEntity: r));
        });
      }
    });
  }

  Future<bool> isAuthenticated() async {
    final res = await getClientCachedDataUseCase.call();
    res.fold((l) {
      return false;
    }, (r) {
      return true;
    });
    return false;
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
        }case EmptyCacheFailure:{
          return EMPTY_CACHE_FAILURE_MESSAGE;
    }
      default:
        return 'un expected error,please try again later ';
    }
  }
}
