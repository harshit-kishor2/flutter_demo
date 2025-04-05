import 'package:flutter/material.dart';
import 'package:person_plan/core/helper/package_info_helper.dart';

const _versionBottomPadding = 15.0;
const _versionRightPadding = 25.0;

class AppVersion extends StatelessWidget {
  AppVersion({super.key});
  final packageInfo = PackageInfoHelper.instance;

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
