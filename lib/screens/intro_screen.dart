import 'package:chat/components/logo_animation.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            //App Name
            LogoAnimation(),

            // //Get Started Button
            // Button(text: "Get Started"),
          ],
        ),
      ),
    );
  }
}
