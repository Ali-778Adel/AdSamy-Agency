
import 'package:ad_samy/core/network/network-checker.dart';
import 'package:ad_samy/features/authentiacation/data/data-source/auth-data-source.dart';
import 'package:ad_samy/features/authentiacation/data/data-source/auth-local-data-source.dart';
import 'package:ad_samy/features/authentiacation/data/repository/auth-repository-impl.dart';
import 'package:ad_samy/features/authentiacation/domain/repository/auth-repository.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/get-client-chached-data-use-case.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/login-use-case.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/send-password-verification-use-case.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/sign-up%20use-case.dart';
import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-bloc.dart';
import 'package:ad_samy/features/client-projects/data/data-source/client-projects-data-source.dart';
import 'package:ad_samy/features/client-projects/data/repository/client-project-repository-impl.dart';
import 'package:ad_samy/features/client-projects/domain/use-cases/get-client-data.dart';
import 'package:ad_samy/features/client-projects/domain/use-cases/get-client-projects-use-case.dart';
import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-bloc.dart';
import 'package:ad_samy/features/profile/data/data-source/loacal-data-source.dart';
import 'package:ad_samy/features/profile/data/repositoyr-impl/profile-repositoyr-impl.dart';
import 'package:ad_samy/features/profile/domain/get-user-data-use-case/delete-use-cached-use-case.dart';
import 'package:ad_samy/features/profile/domain/get-user-data-use-case/get-user-cached-data-use-case.dart';
import 'package:ad_samy/features/profile/domain/repository/profile-repository.dart';
import 'package:ad_samy/features/profile/presentation/profile-bloc/profile-bloc.dart';
import 'package:ad_samy/features/services/data/data_source/services_data_source.dart';
import 'package:ad_samy/features/services/domain/repository/domain_repository.dart';
import 'package:ad_samy/features/services/domain/use_cases/send-lead-form-sue-case.dart';
import 'package:ad_samy/features/services/domain/use_cases/show-service-details-use-case.dart';
import 'package:ad_samy/features/services/domain/use_cases/show_services_use_case.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc.dart';
import 'package:ad_samy/features/team-projects/data/data-source/team-remote-data-source.dart';
import 'package:ad_samy/features/team-projects/data/repository/team-repository-impl.dart';
import 'package:ad_samy/features/team-projects/domain/repository/team-repository.dart';
import 'package:ad_samy/features/team-projects/domain/use-case/team-all-projects-use-case.dart';
import 'package:ad_samy/features/team-projects/domain/use-case/team-overview-use-case.dart';
import 'package:ad_samy/features/team-projects/domain/use-case/team-task-details-use-case.dart';
import 'package:ad_samy/features/team-projects/domain/use-case/update-task-use-case.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../features/client-projects/domain/repository/client-repository.dart';
import '../features/client-projects/domain/use-cases/get-all-client-projects.dart';
import '../features/services/data/repository/data_repository.dart';
import '../features/team-projects/domain/use-case/project-tasks-use-case.dart';
import '../features/team-projects/domain/use-case/team-all-tasks-use-case.dart';

final sl=GetIt.instance;

Future<void>init()async{
  //auth feature
  sl.registerFactory(() => AuthBloc(
      signUpUseCase: sl(), loginUseCase:sl(), otpUseCase: sl(),getClientCachedDataUseCase: sl()
    // confirmPasswordUseCase: sl(),
  ));

  sl.registerLazySingleton(() => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  // sl.registerLazySingleton(() => ConfirmPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => OTPUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetClientCachedDataUseCase(authRepository: sl()));
  // sl.registerLazySingleton(() => SignUpParams(email: sl(), phoneNumber: sl(), password: sl()));

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImplWithHttp(client: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(networkInfo: sl(), authDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImplWithSharedPref(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));



  //service feature
  sl.registerFactory(() =>ShowAllServicesBloc(
      getAllServicesUseCase: sl(),
      showServiceDetailsUseCase: sl(),
     registerLeadFormUseCase: sl(),
  ));

  sl.registerLazySingleton(() => GetAllServicesUseCase(repository: sl()));
  sl.registerLazySingleton(() => ShowServiceDetailsUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterLeadFormUseCase(repository: sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(servicesDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ServicesDataSource>(() => ServiceDataSourceImplWithHttp(client: sl()));




  //client projects feature

  //bloc
  sl.registerFactory(() => ClientProjectBloc(
      getClientProjectsUseCase: sl(),
      getClientDataUseCase: sl(),
      clientProjectsDataSource: sl(),
      getClientAllProjectsUseCase: sl()
  ));

  //use cases
  sl.registerLazySingleton(() => GetClientProjectsUseCase(clientProjectRepository: sl()));
  sl.registerLazySingleton(() => GetClientAllProjectsUseCase(clientProjectRepository: sl()));
  sl.registerLazySingleton(() => GetClientDataUseCase(clientProjectRepository: sl()));

  //repositoyr
  sl.registerLazySingleton<ClientProjectRepository>(() => ClientProjectRepositoryImpl(networkInfo: sl(), clientProjectsDataSource: sl()));

  //datasource
  sl.registerLazySingleton<ClientProjectsDataSource>(() => ClientProjectsDataSourceImpWithHttp(client: sl(),sharedPreferences: sl()));


  //Profile feature
  sl.registerFactory(() => ProfileBloc(
      getUserProfileCachedDataUseCase: sl(),
      deleteUserCachedDataUseCase: sl(),

  ));
  //useCase
  sl.registerLazySingleton(() => GetUserProfileCachedDataUseCase(profileRepository: sl()));
  sl.registerLazySingleton(() => DeleteUserCachedDataUseCase(profileRepository: sl()));
  //repository
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(profileLocalDataSource: sl()));
  //dataSource
  sl.registerLazySingleton<ProfileLocalDataSource>(() => ProfileLocalDataSourceImpl(sharedPreferences:sl()));

//team feature

  sl.registerFactory(() => TeamBloc(
      teamOverViewUseCase: sl(),
      teamAllProjectsUseCase: sl(),
      projectsTasksUseCase: sl(),
      teamTaskDetailsUseCase: sl(),
    teamRemoteDataSource: sl(),
    updateTaskUseCase: sl(),
    teamAllTasksUseCase: sl(),
  ));
//use cases
sl.registerLazySingleton(() => TeamOverViewUseCase(teamRepository: sl()));
sl.registerLazySingleton(() => TeamAllProjectsUseCase(teamRepository: sl()));
sl.registerLazySingleton(() => ProjectsTasksUseCase(teamRepository: sl()));
sl.registerLazySingleton(() => TeamTaskDetailsUseCase(teamRepository: sl()));
sl.registerLazySingleton(() => UpdateTaskUseCase(teamRepository: sl()));
sl.registerLazySingleton(() => TeamAllTasksUseCase(teamRepository: sl()));

//abstracts
  sl.registerLazySingleton<TeamRepository>(() => TeamRepositoryImpl(teamRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<TeamRemoteDataSource>(() => TeamRemoteDataSourceImplWithHttp(client: sl(),sharedPreferences: sl()));
  //general Plugin

  final sharedPreferences=await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedPreferences);


}

