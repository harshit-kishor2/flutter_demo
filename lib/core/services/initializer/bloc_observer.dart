part of 'app_initializer.dart';

class _MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // printLog('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // printLog('Bloc State Changed: ${bloc.runtimeType}, $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printLog('Bloc Event: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    printError('Bloc Error: ${bloc.runtimeType}, Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    // printLog('Bloc Closed: ${bloc.runtimeType}');
  }
}
