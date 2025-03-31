import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:person_plan/features/guest/presentation/bloc/guest_bloc.dart';

abstract final class BlocResetHelper {
  /// Resets all blocs to their initial state.
  ///
  /// This is called when the user logs out.
  static void resetAllBlocs(BuildContext context) {
    // Reset the authentication bloc
    context.read<AuthenticationBloc>().add(ResetAuthenticationEvent());

    // Reset the guest bloc
    context.read<GuestBloc>().add(ResetGuestEvent());
  }
}
