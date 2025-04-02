import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState.initial()) {
    on<ResetDashboardEvent>(_onResetDashboardEvent);
  }

  void _onResetDashboardEvent(ResetDashboardEvent event, Emitter<DashboardState> emit) {
    emit(DashboardState.initial());
  }
}
