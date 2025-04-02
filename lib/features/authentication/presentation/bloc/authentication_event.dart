part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class GoogleLoginEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}

class ResetAuthenticationEvent extends AuthenticationEvent {}
