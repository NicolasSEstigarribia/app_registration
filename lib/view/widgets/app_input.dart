import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String title;

  const AppInput({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
