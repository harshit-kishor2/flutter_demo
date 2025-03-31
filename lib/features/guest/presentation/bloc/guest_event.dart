part of 'guest_bloc.dart';

abstract class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

/// Handles the [AppStarted] event.
///
/// This event is dispatched when the app is started.
///
/// It checks if the user is authenticated and if it's the first launch.
/// If it's the first launch, it clears the shared preferences and sets
/// the [SharedPrefUtils.isFirstLaunch] to `false`.
///
/// It then emits a new [GuestState] with the [GuestState.isSplashEnd] set
/// to `true` and the [GuestState.isAuthenticated] set to the value of
/// [SharedPrefUtils.isAuthenticated].
class AppStarted extends GuestEvent {}
