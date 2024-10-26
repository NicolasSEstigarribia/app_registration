import 'package:app_registration/consts/app_theme.dart';
import 'package:app_registration/controllers/splash_bloc/splash_bloc.dart';
import 'package:app_registration/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: MaterialApp(
        title: 'App Registration',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
