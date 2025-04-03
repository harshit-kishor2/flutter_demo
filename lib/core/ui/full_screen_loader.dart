import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:person_plan/core/constants/image_const.dart';

class FullScreenLoader extends StatelessWidget {
  final bool loading;
  final Widget child;
  final String? lottieAssetPath;
  final double? width;
  final double? height;
  final Color? overlayColor;
  final double? overlayOpacity;

  const FullScreenLoader({
    super.key,
    required this.loading,
    required this.child,
    this.lottieAssetPath,
    this.width = 80,
    this.height = 80,
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          Container(
            color: overlayColor?.withValues(alpha: overlayOpacity ?? 0.5),
            child: Center(
              child: Lottie.asset(
                lottieAssetPath ?? AnimationConst.loader,
                width: width,
                height: height,
                fit: BoxFit.contain,
              ),
            ),
          ),
      ],
    );
  }
}
