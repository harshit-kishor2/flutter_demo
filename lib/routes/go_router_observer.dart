part of 'app_router.dart';

class _GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(final Route<dynamic> route, final Route<dynamic>? previousRoute) {
    printLog('Pushed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didPop(final Route<dynamic> route, final Route<dynamic>? previousRoute) {
    printLog('Popped: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didRemove(final Route<dynamic> route, final Route<dynamic>? previousRoute) {
    printLog('Removed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didReplace({final Route<dynamic>? newRoute, final Route<dynamic>? oldRoute}) {
    printLog(
        'Replaced: ${newRoute?.settings.name}, with arguments: ${newRoute?.settings.arguments}');
  }
}
