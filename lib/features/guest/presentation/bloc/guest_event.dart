part of 'guest_bloc.dart';

abstract class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

//! This event is dispatched when the app is started.
///
/// It checks if the user is authenticated and if it's the first launch.
///
/// If it's the first launch, it navigates to the onboarding screen.
///
/// If the user is authenticated, it navigates to the home screen.
///
/// If the user is not authenticated, it navigates to the login screen.
class AppStarted extends GuestEvent {}

//! This event is dispatched when the user logs out.
///
/// Resets the guest state to its initial state.
///
/// This is called when the user logs out.
class ResetGuestEvent extends GuestEvent {}
