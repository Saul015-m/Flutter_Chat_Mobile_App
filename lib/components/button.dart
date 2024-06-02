import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function()? onTap;
  final Widget? icon;

  const Button({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 70, 50, 93),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
