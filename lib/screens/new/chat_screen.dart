import 'package:chat/screens/home/navigation_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const Center(
                  child: Text('New Chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
