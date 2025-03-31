import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:person_plan/core/helper/device_info_helper.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/helper/package_info_helper.dart';
import 'package:person_plan/core/services/dio/dio_client.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/core/theme/theme_cubit.dart';
import 'package:person_plan/features/guest/presentation/bloc/guest_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeServiceLocater() async {
  printInfo('Starting service locator initialization...');

  serviceLocator.registerLazySingleton<GuestBloc>(() => GuestBloc());

// ================ Theme Cubit ================
  // A singleton ensures that there’s only one instance of ThemeCubit
  serviceLocator.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(sharedPref: serviceLocator<SharedPref>()));

// ============== Shared Pref Helper ==============
  // Register SharedPref as a singleton
  serviceLocator.registerLazySingleton<SharedPref>(() => SharedPref());
  // Initialize the SharedPref after registration
  await serviceLocator<SharedPref>().init();

// ============== Device Info Helper ==============
  // Register DeviceInfoHelper as a singleton
  serviceLocator.registerLazySingleton<DeviceInfoHelper>(() => DeviceInfoHelper.instance);
  // Initialize the DeviceInfoHelper after registration
  await DeviceInfoHelper.initialize();

// ================ Package Info Helper ================
  // Register PackageInfoHelper as a singleton
  serviceLocator.registerLazySingleton<PackageInfoHelper>(() => PackageInfoHelper.instance);
  await PackageInfoHelper.initialize();

// ================ Dio Client ================
// Register DioClient as a singleton
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());
  // Register Dio instance so you can inject it directly
  serviceLocator.registerLazySingleton<Dio>(() => serviceLocator<DioClient>().client);

  // Wait for all async registrations to complete
  await serviceLocator.allReady();

  printInfo('Service locator initialization completed.');
}
