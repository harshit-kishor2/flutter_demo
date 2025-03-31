import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/constants/app_const.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';

part 'guest_event.dart';
part 'guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc() : super(GuestState.initial()) {
    on<AppStarted>(_onAppStarted);
  }

  void _onAppStarted(AppStarted event, Emitter<GuestState> emit) async {
    await Future.delayed(Duration(seconds: AppConst.splashDurationInSeconds));
    await SharedPrefUtils.handleFirstLaunch();

    emit(state.copyWith(
      isSplashEnd: true,
      isAuthenticated: SharedPrefUtils.isAuthenticated,
    ));
  }
}
