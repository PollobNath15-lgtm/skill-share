import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Profile picture
            const CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),


            const Text(
              "Messi",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),


            const Text(
              "abc@email.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),


            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Name"),
                subtitle: const Text("Messi"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: const Text("abc@email.com"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.school),
                title: const Text("Skill"),
                subtitle: const Text("cooking,football"),
              ),
            ),

            const SizedBox(height: 20),

            // Edit button
            ElevatedButton.icon(
              onPressed: () {
                // Edit profile later
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}