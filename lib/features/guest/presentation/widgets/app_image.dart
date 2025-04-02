import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/image_const.dart';

const _imageSize = 200.0;

class AppImage extends StatelessWidget {
  const AppImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _imageSize,
        height: _imageSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(ImageConst.appIcon),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
