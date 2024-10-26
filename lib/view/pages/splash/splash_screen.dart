
import 'package:app_registration/controllers/splash_bloc/splash_bloc.dart';
import 'package:app_registration/utils/app_router.dart';
import 'package:app_registration/view/widgets/barrel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const AppStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is HomeState) {
          Navigator.pushNamed(context, AppRouter.homeScreen);
        }
        if (state is UnAuthenticatedState) {
          Navigator.pushNamed(context, AppRouter.signInScreen);
        }
      },
      builder: (context, state) {
        return const AppScaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(),
                Text(
                  'App Registration',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
