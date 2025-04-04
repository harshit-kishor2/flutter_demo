import 'package:flutter/material.dart';
import 'package:person_plan/core/ui/custom_styles.dart';

const double iconSize = 34.0;

class NavigationRow extends StatelessWidget {
  final int currentIndex;
  final int length;
  final void Function(int index) onPageChanged;

  const NavigationRow({
    required this.currentIndex,
    required this.length,
    required this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 10, top: 10),
      decoration: CustomStyles.buttonDecoration(theme).copyWith(
        color: Colors.transparent,
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPreviousButton(),
          Text(
            '${currentIndex + 1} / $length',
            style: theme.textTheme.bodyLarge,
          ),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildPreviousButton() {
    if (currentIndex > 0) {
      return GestureDetector(
        onTap: () => onPageChanged(currentIndex - 1),
        child: const Icon(
          Icons.arrow_left,
          size: iconSize,
        ),
      );
    } else {
      return const SizedBox(width: 48);
    }
  }

  Widget _buildNextButton() {
    if ((currentIndex < length - 1)) {
      return GestureDetector(
        onTap: () => onPageChanged(currentIndex + 1),
        child: const Icon(
          Icons.arrow_right,
          size: iconSize,
        ),
      );
    } else {
      return const SizedBox(width: 48);
    }
  }
}
