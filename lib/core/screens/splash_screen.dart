import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/image_const.dart';
import 'package:person_plan/core/helper/package_info_helper.dart';
import 'package:person_plan/di/injection_container.dart';

// Constants
const _animationDuration = Duration(milliseconds: 2000);
const _imageSize = 200.0;
const _scaleBegin = 1.0;
const _scaleEnd = 1.2;
const _versionBottomPadding = 15.0;
const _versionRightPadding = 25.0;
const _splashDuration = Duration(seconds: 5); // Added splash duration

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToLogin();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    )..repeat();

    _controller.forward();
  }

  void _navigateToLogin() {
    Future.delayed(_splashDuration, () {
      if (mounted) {
        // Check if widget is still mounted
        // context.go(RouteConst.login); // Navigate to login route
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _AnimatedImage(controller: _controller),
          _AppVersion(),
        ],
      ),
    );
  }
}

class _AnimatedImage extends StatelessWidget {
  final AnimationController controller;

  const _AnimatedImage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Transform(
          transform: Matrix4.identity()
            ..rotateZ(controller.value * 2 * math.pi)
            ..scale(_scaleBegin + (controller.value * (_scaleEnd - _scaleBegin))),
          alignment: Alignment.center,
          child: _buildImageContainer(),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: _imageSize,
      height: _imageSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(ImageConst.appIcon),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AppVersion extends StatelessWidget {
  final PackageInfoHelper packageInfo = serviceLocator<PackageInfoHelper>();

  _AppVersion();

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
