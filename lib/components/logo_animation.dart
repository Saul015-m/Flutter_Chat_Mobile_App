import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Me",
          style: GoogleFonts.roboto(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            color: const Color.fromARGB(255, 70, 50, 93),
          ),
        ),
        const SizedBox(width: 5),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
              'RESAKA',
              textStyle: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 70, 50, 93),
              ),
              speed: const Duration(milliseconds: 250),
            ),
          ],
        )
      ],
    );
  }
}
