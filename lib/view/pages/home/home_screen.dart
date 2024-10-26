import 'package:app_registration/consts/app_color.dart';
import 'package:app_registration/view/widgets/barrel_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const BorderRadius _borderRadius = BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  );

  void onTapCreateAccount() {
    debugPrint('Sign In');
  }

  void onTapEnter() {
    debugPrint('Sign In');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.background],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const AppLogo(),
            const Spacer(),
            buildBottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomContainer() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: _borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            AppButton(
              type: AppButtonType.secondary,
              title: 'CREAR CUENTA',
              onTap: onTapCreateAccount,
            ),
            AppSpacer.small,
            AppButton(
              type: AppButtonType.primary,
              title: 'INGRESAR',
              onTap: onTapEnter,
            ),
            AppSpacer.medium,
            const TermsAndConditionsText(),
          ],
        ),
      ),
    );
  }
}
