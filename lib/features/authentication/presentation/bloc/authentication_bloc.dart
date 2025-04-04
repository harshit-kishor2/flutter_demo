import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/constants/app_const.dart';
import 'package:person_plan/core/helper/event_state.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/usecases/apple_login_use_case.dart';
import 'package:person_plan/features/authentication/domain/usecases/google_login_use_case.dart';
import 'package:person_plan/features/authentication/domain/usecases/logout_user_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.appleLoginUseCase,
    required this.googleLoginUseCase,
    required this.logoutUserUseCase,
  }) : super(AuthenticationState.initial()) {
    on<AppStarted>(_onAppStarted);
    on<ResetAuthenticationEvent>(_onResetAuthenticationEvent);
    on<GoogleLoginEvent>(_onGoogleLoginEvent);
    on<AppleLoginEvent>(_onAppleLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  final GoogleLoginUseCase googleLoginUseCase;
  final LogoutUserUseCase logoutUserUseCase;
  final AppleLoginUseCase appleLoginUseCase;

  void _onResetAuthenticationEvent(
      ResetAuthenticationEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.initial());
  }

  void _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    await Future.delayed(const Duration(seconds: AppConst.splashDurationInSeconds));
    await SharedPrefUtils.handleFirstLaunch();
    emit(state.copyWith(
      isSplashEnd: true,
      isAuthenticated: SharedPrefUtils.isAuthenticated,
    ));
  }

  void _onGoogleLoginEvent(GoogleLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loginEventState: EventPending()));
    try {
      final result = await googleLoginUseCase.execute();
      result.fold(
        (failure) {
          emit(
            state.copyWith(loginEventState: EventFailedWithMessage(message: failure.message)),
          );
        },
        (user) {
          emit(state.copyWith(
            isAuthenticated: true,
            loginEventState: EventSuccess(),
            user: user,
          ));
        },
      );
    } catch (e) {
      printError('Google login error inside bloc: $e');
      emit(state.copyWith(loginEventState: EventFailed()));
    } finally {
      emit(state.copyWith(loginEventState: const EventIdle()));
    }
  }

  void _onAppleLoginEvent(AppleLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loginEventState: EventPending()));
    try {
      final result = await appleLoginUseCase.execute();
      result.fold(
        (failure) {
          emit(state.copyWith(
            loginEventState: EventFailedWithMessage(message: failure.message),
          ));
        },
        (user) {
          emit(state.copyWith(
            isAuthenticated: true,
            loginEventState: EventSuccess(),
            user: user,
          ));
        },
      );
    } catch (e) {
      printError('Apple login error inside bloc: $e');
      emit(state.copyWith(loginEventState: EventFailed()));
    } finally {
      emit(state.copyWith(loginEventState: const EventIdle()));
    }
  }

  void _onLogoutEvent(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(logoutEventState: EventPending()));
    try {
      final result = await logoutUserUseCase.execute();
      result.fold(
        (failure) => emit(
            state.copyWith(logoutEventState: EventFailedWithMessage(message: failure.message))),
        (message) =>
            emit(state.copyWith(logoutEventState: EventSuccessWithMessage(message: message))),
      );
    } catch (e) {
      printError('Logout error inside bloc: $e');
      emit(state.copyWith(logoutEventState: EventFailed()));
    } finally {
      emit(state.copyWith(logoutEventState: const EventIdle()));
    }
  }
}
