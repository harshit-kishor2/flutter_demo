part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    required this.isAuthenticated,
    required this.loginEventState,
    required this.isSplashEnd,
    required this.logoutEventState,
    this.user,
  });

  factory AuthenticationState.initial() => const AuthenticationState(
        isSplashEnd: false,
        isAuthenticated: false,
        loginEventState: EventIdle(),
        logoutEventState: EventIdle(),
        user: null,
      );

  final bool isSplashEnd;
  final bool isAuthenticated;
  final EventState loginEventState;
  final EventState logoutEventState;
  final UserEntity? user;

  AuthenticationState copyWith({
    bool? isSplashEnd,
    bool? isAuthenticated,
    EventState? loginEventState,
    EventState? logoutEventState,
    UserEntity? user,
  }) {
    return AuthenticationState(
      isSplashEnd: isSplashEnd ?? this.isSplashEnd,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      loginEventState: loginEventState ?? this.loginEventState,
      logoutEventState: logoutEventState ?? this.logoutEventState,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        isAuthenticated,
        loginEventState,
        logoutEventState,
        isSplashEnd,
      ];
}
