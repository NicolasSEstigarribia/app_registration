import 'package:app_registration/utils/app_router.dart';
import 'package:app_registration/view/widgets/barrel_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onTapCreateAccount(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.createAccountScreen);
  }

  void onTapEnter() {
    debugPrint('Sign In');
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const AppLogo(),
          const Spacer(),
          buildBottomContainer(context),
        ],
      ),
    );
  }

  Widget buildBottomContainer(BuildContext context) {
    return AppRoundedContainer(
      child: Column(
        children: [
          AppButton(
            type: AppButtonType.secondary,
            title: 'CREAR CUENTA',
            onTap: () => onTapCreateAccount(context),
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
    );
  }
}
