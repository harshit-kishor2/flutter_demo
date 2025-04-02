import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'SUBMIT',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Registration',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            _buildListTile(title: 'Agree to Contract Terms'),
            _buildListTile(title: 'Personal Info'),
            _buildListTile(title: 'Bio Info'),
            _buildListTile(title: 'Strengths'),
            _buildListTile(title: 'Challenges', trailingIcon: Icons.image),
            _buildListTile(title: 'Likes', trailingIcon: Icons.image),
            _buildListTile(title: 'Dislikes'),
            _buildListTile(title: 'Independence'),
            _buildListTile(title: 'Needs Help'),
            _buildListTile(title: 'Activities'),
            _buildListTile(title: 'Dreams'),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({required String title, IconData? trailingIcon}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: Icon(
        trailingIcon ?? Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
