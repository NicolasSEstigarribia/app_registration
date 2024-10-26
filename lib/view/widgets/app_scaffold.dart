import 'package:app_registration/consts/app_color.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? title;
  final List<Widget> actionsAppBar;
  final Function()? overrideBackAction;
  final bool hideBackButton;
  final Widget body;
  final Widget bottomNavigationBar;

  const AppScaffold({
    super.key,
    this.title,
    required this.body,
    this.actionsAppBar = const [],
    this.overrideBackAction,
    this.hideBackButton = false,
    this.bottomNavigationBar = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    Widget leading = IconButton(
      padding: const EdgeInsets.only(left: 24),
      onPressed: () {
        if (overrideBackAction != null) {
          overrideBackAction!();
          return;
        }

        Navigator.pop(context);
      },
      highlightColor: Colors.transparent,
      icon: const Icon(Icons.arrow_back),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: title == null
          ? null
          : AppBar(
              title: title,
              actions: actionsAppBar,
              leading: hideBackButton ? null : leading,
            ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.background],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            body,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: bottomNavigationBar,
            ),
          ],
        ),
      ),
    );
  }
}
