import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/sign-up-entity.dart';
enum ProgressType{
  login,signUp,confirmPassword,verifyOTP,getCachedData;


  bool get isLogin => this==ProgressType.login;

  bool get isSignUp => this==ProgressType.signUp;

  bool get isConfirmPassword => this==ProgressType.confirmPassword;

  bool get isVerifyOTP => this==ProgressType.verifyOTP;
  bool get getCached => this==ProgressType.getCachedData;

}
enum ProgressStatus{
  loading,success,failure;

  bool get isLoading =>this ==ProgressStatus.loading;

  bool get isSuccess =>this ==ProgressStatus.success;

  bool get isFailure =>this ==ProgressStatus.failure;

}

// Map<String,Object>o={'signUpEntity':SignUpEntity,'loginEntity':LoginEntity};
// enum ProgressEntity{loginEntity,signUpEntity,confirmPasswordEntity,verifyOtpEntity}

class AuthState extends Equatable{

 final  ProgressType ?progressType;
 final  Object ? progressEntity;
 final  ProgressStatus? progressStatus;
 final String ?errorMessage;


 const AuthState({
   this.progressType,
   this.progressStatus = ProgressStatus.loading,
   this.progressEntity,
   this.errorMessage,

});

 AuthState copyWith({
   ProgressType?progressType,
   ProgressStatus?progressStatus,
   Object ?progressEntity,
   String?errorMessage
}){
   return AuthState(
     progressType: progressType,
     progressStatus: progressStatus,
     progressEntity: progressEntity,
     errorMessage: errorMessage,
   );
 }


  @override
  List<Object?> get props => [progressEntity,progressStatus,progressType];
}

