import 'package:flutter/material.dart';
import 'package:person_plan/core/helper/package_info_helper.dart';
import 'package:person_plan/di/injection_container.dart';

const _versionBottomPadding = 15.0;
const _versionRightPadding = 25.0;

class AppVersion extends StatelessWidget {
  final PackageInfoHelper packageInfo = serviceLocator<PackageInfoHelper>();

  AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final version = '${packageInfo.version}(${packageInfo.buildNumber})';
    final textTheme = Theme.of(context).textTheme;
    return Positioned(
      bottom: _versionBottomPadding,
      right: _versionRightPadding,
      child: Text(
        version,
        style: textTheme.labelSmall,
      ),
    );
  }
}
