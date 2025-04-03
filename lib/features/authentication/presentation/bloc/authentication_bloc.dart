import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/constants/app_const.dart';
import 'package:person_plan/core/helper/event_state.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/usecases/google_login_use_case.dart';
import 'package:person_plan/features/authentication/domain/usecases/logout_user_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GoogleLoginUseCase googleLoginUseCase;
  final LogoutUserUseCase logoutUserUseCase;
  AuthenticationBloc({required this.googleLoginUseCase, required this.logoutUserUseCase})
      : super(AuthenticationState.initial()) {
    on<AppStarted>(_onAppStarted);
    on<ResetAuthenticationEvent>(_onResetAuthenticationEvent);
    on<GoogleLoginEvent>(_onGoogleLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  _onResetAuthenticationEvent(ResetAuthenticationEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.initial());
  }

  void _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    // Wait for the splash screen to end
    await Future.delayed(Duration(seconds: AppConst.splashDurationInSeconds));
    // Handle the first launch
    await SharedPrefUtils.handleFirstLaunch();

    // Emit the new state
    emit(state.copyWith(
      isSplashEnd: true,
      isAuthenticated: SharedPrefUtils.isAuthenticated,
    ));
  }

  _onGoogleLoginEvent(GoogleLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loginEventState: EventPending()));
    try {
      final result = await googleLoginUseCase();
      result.fold(
        (error) => emit(state.copyWith(loginEventState: EventFailedWithMessage(message: error))),
        (user) {
          emit(state.copyWith(
            isAuthenticated: true,
            loginEventState: EventSuccess(),
            user: user,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(loginEventState: EventFailedWithMessage(message: e.toString())));
    } finally {
      emit(state.copyWith(loginEventState: EventIdle()));
    }
  }

  _onLogoutEvent(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(logoutEventState: EventPending()));
    try {
      await logoutUserUseCase();
      emit(state.copyWith(logoutEventState: EventSuccess()));
    } catch (e) {
      emit(state.copyWith(logoutEventState: EventFailed()));
    } finally {
      emit(state.copyWith(logoutEventState: EventIdle()));
    }
  }
}
