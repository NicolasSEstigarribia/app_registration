import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: const Icon(
        Icons.filter_tilt_shift,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
