part of 'app.dart';

class ResponsiveUiWrapper extends StatelessWidget {
  /// A wrapper for responsive UI using ScreenUtil.
  ///
  /// This widget initializes the [ScreenUtil] and provides a consistent
  /// layout for its [child]. The [designSize] is set to a default of
  /// 375*812, suitable for a typical mobile screen, and it enables
  /// adaptive text scaling and split-screen mode.
  const ResponsiveUiWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, childWidget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
