import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:person_plan/core/constants/color_const.dart';
import 'package:person_plan/core/constants/enum.dart';
import 'package:person_plan/core/constants/image_const.dart';
import 'package:person_plan/core/i18n/l10n.dart';
import 'package:person_plan/core/ui/custom_styles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.type,
    required this.onTap,
  });

  final SocialLoginType type;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final i18n = I18n.of(context);

    final svgImage = type == SocialLoginType.apple ? SvgConst.appleIcon : SvgConst.googleIcon;

    final buttonText = type == SocialLoginType.apple ? i18n.apple_login : i18n.google_login;

    final defaultDecoration = type == SocialLoginType.apple
        ? CustomStyles.buttonDecoration(theme).copyWith(
            color: ColorConst.backgroundDark,
          )
        : CustomStyles.buttonDecorationOutlined(theme);

    final defaultTextStyle = type == SocialLoginType.apple
        ? theme.textTheme.bodyLarge?.copyWith(
            color: ColorConst.backgroundLight,
          )
        : theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.primary,
          );

    final colorFilter = type == SocialLoginType.apple
        ? const ColorFilter.mode(ColorConst.backgroundLight, BlendMode.srcIn)
        : null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: CustomStyles.buttonHeight,
        padding: CustomStyles.buttonPadding,
        decoration: defaultDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                svgImage,
                height: 16,
                width: 16,
                colorFilter: colorFilter,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              buttonText,
              style: defaultTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
