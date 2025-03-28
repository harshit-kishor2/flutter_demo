// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final bool isAuthenticated;
  final EventState loginEventState;

  const AuthenticationState({
    required this.isAuthenticated,
    required this.loginEventState,
  });

  factory AuthenticationState.initial() => const AuthenticationState(
        isAuthenticated: false,
        loginEventState: EventIdle(),
      );

  AuthenticationState copyWith({
    bool? isAuthenticated,
    EventState? loginEventState,
  }) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      loginEventState: loginEventState ?? this.loginEventState,
    );
  }

  @override
  List<Object> get props => [];
}
