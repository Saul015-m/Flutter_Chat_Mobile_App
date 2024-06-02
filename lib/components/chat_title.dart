import 'package:flutter/material.dart';

class ChatTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ChatTitle({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 70, 50, 93),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 70, 50, 93),
            ),
          ),
        ],
      ),
    );
  }
}
