import 'package:flutter/material.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/drawer_screen.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                _buildListTile(title: ' Agree to Contract Terms'),
                _buildListTile(title: 'Personal Info'),
                _buildListTile(title: 'Bio Info'),
                _buildListTile(title: 'Diagnosis'),
                _buildListTile(title: 'Strengths'),
                _buildListTile(title: 'Challenges', trailingIcon: Icons.image),
                _buildListTile(title: 'Likes', trailingIcon: Icons.image),
                _buildListTile(title: 'Dislikes'),
                _buildListTile(title: 'Independence'),
                _buildListTile(title: 'Needs Help'),
                _buildListTile(title: 'Activities'),
                _buildListTile(title: 'Dislike Activities'),
                _buildListTile(title: 'Primary Support Team'),
                _buildListTile(title: 'Secondary Support Team'),
                _buildListTile(title: 'Dreams'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildListTile({
  required String title,
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
        title,
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
        // Add your navigation or click handling here
      },
    ),
  );
}
