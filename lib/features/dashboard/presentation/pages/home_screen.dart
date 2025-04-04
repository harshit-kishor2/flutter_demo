import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/drawer_screen.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/form_section_enum.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/home_header.dart';
import 'package:person_plan/routes/route_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      body: Column(
        children: [
          const HomeHeader(
            title: 'Person Plan',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: FormSectionEnum.values
                  .map((section) => _buildListTile(context, section: section))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required FormSectionEnum section,
    IconData? trailingIcon,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          section.displayTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          trailingIcon ?? Icons.arrow_forward_ios,
          color: Colors.blue.shade700,
          size: 24,
        ),
        onTap: () {
          // Navigate to form screen with current section
          context.pushNamed(RouteConst.form, extra: section);
        },
      ),
    );
  }
}
