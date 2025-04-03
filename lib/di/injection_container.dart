import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:person_plan/core/helper/device_info_helper.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/helper/package_info_helper.dart';
import 'package:person_plan/core/services/dio/dio_client.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/core/theme/theme_cubit.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:person_plan/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';
import 'package:person_plan/features/authentication/domain/usecases/apple_login_use_case.dart';
import 'package:person_plan/features/authentication/domain/usecases/google_login_use_case.dart';
import 'package:person_plan/features/authentication/domain/usecases/logout_user_use_case.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeServiceLocater() async {
  printInfo('Starting service locator initialization...');

//! ================ Authentication Feature ================

// bloc
  serviceLocator.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
        googleLoginUseCase: serviceLocator(),
        logoutUserUseCase: serviceLocator(),
        appleLoginUseCase: serviceLocator(),
      ));

// use cases
  serviceLocator
      .registerLazySingleton<GoogleLoginUseCase>(() => GoogleLoginUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton<LogoutUserUseCase>(() => LogoutUserUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton<AppleLoginUseCase>(() => AppleLoginUseCase(serviceLocator()));

// repositories
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: serviceLocator(), localDataSource: serviceLocator()));

// datasources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(firebaseAuth: serviceLocator(), googleSignIn: serviceLocator()));

  serviceLocator.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());

//! ================ Theme Cubit ================
  // A singleton ensures that there’s only one instance of ThemeCubit
  serviceLocator.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(sharedPref: serviceLocator<SharedPref>()));

//! ============== Shared Pref Helper ==============
  // Register SharedPref as a singleton
  serviceLocator.registerLazySingleton<SharedPref>(() => SharedPref());
  // Initialize the SharedPref after registration
  await serviceLocator<SharedPref>().init();

//! ============== Device Info Helper ==============
  // Register DeviceInfoHelper as a singleton
  serviceLocator.registerLazySingleton<DeviceInfoHelper>(() => DeviceInfoHelper.instance);
  // Initialize the DeviceInfoHelper after registration
  await DeviceInfoHelper.initialize();

//! ================ Package Info Helper ================
  // Register PackageInfoHelper as a singleton
  serviceLocator.registerLazySingleton<PackageInfoHelper>(() => PackageInfoHelper.instance);
  await PackageInfoHelper.initialize();

//! ================ Dio Client ================
// Register DioClient as a singleton
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());
  // Register Dio instance so you can inject it directly
  serviceLocator.registerLazySingleton<Dio>(() => serviceLocator<DioClient>().client);

//! ================ Other External services ================
  // External Services
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => GoogleSignIn());

  // Wait for all async registrations to complete
  await serviceLocator.allReady();

  printInfo('Service locator initialization completed.');
}
