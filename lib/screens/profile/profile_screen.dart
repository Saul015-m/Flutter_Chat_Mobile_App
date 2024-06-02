import 'package:chat/components/chat_title.dart';
import 'package:chat/components/profile_image.dart';
import 'package:chat/components/text_input.dart';
import 'package:chat/screens/home/navigation_screen.dart';
import 'package:chat/screens/profile/new_password_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            ChatTitle(
              title: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            const ProfileImage(),
            const SizedBox(height: 50),
            TextInput(
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.person,
              suffixIcon: const Icon(Icons.edit),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Want to update password ? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Click here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 70, 50, 93),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
