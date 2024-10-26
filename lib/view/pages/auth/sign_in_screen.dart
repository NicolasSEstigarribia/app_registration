import 'package:app_registration/view/widgets/barrel_widgets.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          children: [
            _singinText(),
            AppSpacer.medium,
            const AppInput(title: 'Email'),
            AppSpacer.small,
            const AppInput(title: 'Contraseña'),
            const Spacer(),
            AppButton(
              title: 'Loguearse',
              onTap: () {
                debugPrint('Sign In asdasdas');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _singinText() {
    return const Text(
      'Sing in',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
