import 'package:flutter/material.dart';
import 'package:person_plan/core/i18n/l10n.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildGradientBackground(),
        child: const Center(
          child: _PageNotFoundContent(),
        ),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade900,
          Colors.purple.shade600,
        ],
      ),
    );
  }
}

class _PageNotFoundContent extends StatelessWidget {
  const _PageNotFoundContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _build404Text(context),
        const SizedBox(height: 20),
        _buildErrorMessage(context),
        const SizedBox(height: 10),
        _buildDescription(context),
        const SizedBox(height: 40),
        _buildIllustration(context),
        const SizedBox(height: 40),
        _buildBackButton(context),
      ],
    );
  }

  Widget _build404Text(BuildContext context) {
    return Text(
      I18n.of(context).code_404,
      style: TextStyle(
        fontSize: 120,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: const [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black26,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage(context) {
    return Text(
      I18n.of(context).page_not_found,
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        I18n.of(context).page_not_found_desc,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildIllustration(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          Icon(
            Icons.search_off,
            size: 100,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        I18n.of(context).back_to_home,
        style: TextStyle(
          fontSize: 18,
          color: Colors.blue.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
