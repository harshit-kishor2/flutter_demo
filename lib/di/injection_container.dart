import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/helper/package_info_helper.dart';
import 'package:person_plan/core/services/dio/dio_client.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/core/theme/theme_cubit.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:person_plan/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeServiceLocater() async {
  printInfo('Starting service locator initialization...');

  await SharedPref.initialize();
  await PackageInfoHelper.initialize();

//! ================ Authentication Feature ================

// bloc
  serviceLocator.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
        authRepository: serviceLocator(),
      ));

// repositories
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authRemoteDataSource: serviceLocator(),
        localDataSource: serviceLocator(),
      ));

// datasources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());

  serviceLocator.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());

//! ================ Theme Cubit ================
  // A singleton ensures that there’s only one instance of ThemeCubit
  serviceLocator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

//! ================ Dio Client ================
// Register DioClient as a singleton
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());
  // Register Dio instance so you can inject it directly
  serviceLocator.registerLazySingleton<Dio>(() => serviceLocator<DioClient>().client);

//! ================ Other External services ================

  // Wait for all async registrations to complete
  await serviceLocator.allReady();

  printInfo('Service locator initialization completed.');
}
