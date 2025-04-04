import 'package:flutter/material.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/form_section_enum.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/home_header.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/navigation_row.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    super.key,
    required this.section,
  });

  final FormSectionEnum section;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final PageController _pageController = PageController();
  late int _currentIndex;
  final allSections = FormSectionEnum.values;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.section.index;

    // Jump to correct section initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_currentIndex);
    });
  }

  void _goToPage(int index) {
    if (index >= 0 && index < allSections.length) {
      setState(() {
        _currentIndex = index;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSection = allSections[_currentIndex];

    return Scaffold(
      body: Column(
        children: [
          // Custom Header
          HomeHeader(
            title: currentSection.displayTitle,
            showBackButton: true,
            showSubmitButton: false,
          ),

          // PageView Content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: allSections.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final section = allSections[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        section.displayTitle,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: section.getFormSectionPage()),
                  ],
                );
              },
            ),
          ),
          NavigationRow(
            currentIndex: _currentIndex,
            length: allSections.length,
            onPageChanged: _goToPage,
          )
        ],
      ),
    );
  }
}
