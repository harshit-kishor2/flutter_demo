import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/constants/app_const.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';

part 'guest_event.dart';
part 'guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc() : super(GuestState.initial()) {
    on<AppStarted>(_onAppStarted);
    on<ResetGuestEvent>(_onResetGuestEvent);
  }

  void _onResetGuestEvent(ResetGuestEvent event, Emitter<GuestState> emit) {
    emit(GuestState.initial());
  }

  void _onAppStarted(AppStarted event, Emitter<GuestState> emit) async {
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
}
