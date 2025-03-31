part of 'guest_bloc.dart';

class GuestState extends Equatable {
  final bool isSplashEnd;
  final bool isAuthenticated;

  const GuestState({
    this.isSplashEnd = false,
    this.isAuthenticated = false,
  });

  factory GuestState.initial() => const GuestState(
        isSplashEnd: false,
        isAuthenticated: false,
      );

  GuestState copyWith({
    bool? isSplashEnd,
    bool? isAuthenticated,
  }) {
    return GuestState(
      isSplashEnd: isSplashEnd ?? this.isSplashEnd,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  List<Object> get props => [isSplashEnd, isAuthenticated];
}
