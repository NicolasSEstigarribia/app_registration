import 'package:app_registration/consts/app_color.dart';
import 'package:flutter/material.dart';

class AppRoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double height;
  const AppRoundedContainer(
      {super.key, required this.child, this.padding, this.height = 200});

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    );

    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: child,
      ),
    );
  }
}
