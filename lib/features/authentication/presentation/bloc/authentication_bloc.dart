import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/helper/event_state.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.initial()) {
    on<ResetAuthenticationEvent>(_onResetAuthenticationEvent);
  }

  _onResetAuthenticationEvent(ResetAuthenticationEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.initial());
  }
}
