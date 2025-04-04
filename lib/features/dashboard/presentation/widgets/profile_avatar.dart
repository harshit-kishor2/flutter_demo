import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';
import 'package:person_plan/core/constants/image_const.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    this.photoUrl,
    this.defaultAssetPath,
    this.borderColor,
    this.radius = 40.0, // Default radius (adjust as needed)
  });

  final String? photoUrl;
  final String? defaultAssetPath;
  final Color? borderColor;
  final double radius;

  @override
  ProfileAvatarState createState() => ProfileAvatarState();
}

class ProfileAvatarState extends State<ProfileAvatar> {
  bool _imageFailed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.borderColor ?? ColorConst.borderColor,
          width: 0.5, // Border thickness (adjust as needed)
        ),
      ),
      child: CircleAvatar(
        radius: widget.radius,
        backgroundColor: Colors.transparent,
        backgroundImage: widget.photoUrl != null && widget.photoUrl!.isNotEmpty && !_imageFailed
            ? NetworkImage(widget.photoUrl!)
            : AssetImage(widget.defaultAssetPath ?? ImageConst.person) as ImageProvider,
        onBackgroundImageError: widget.photoUrl != null && widget.photoUrl!.isNotEmpty
            ? (exception, stackTrace) {
                setState(() {
                  _imageFailed = true; // Switch to asset image on error
                });
              }
            : null,
      ),
    );
  }
}
