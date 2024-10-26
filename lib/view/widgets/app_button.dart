import 'package:app_registration/consts/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.title,
    this.tintColor = AppColors.primary,
    this.type = AppButtonType.primary,
    this.onTap,
  });

  final String title;
  final Color tintColor;
  final AppButtonType type;

  final void Function()? onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  double minWidth = 0;

  GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  BoxDecoration getButtonDecoration() {
    switch (widget.type) {
      case AppButtonType.primary:
        return BoxDecoration(
          color: widget.tintColor,
          borderRadius: BorderRadius.circular(8),
        );
      case AppButtonType.secondary:
        return BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.tintColor,
            width: 2,
          ),
        );
    }
  }

  Widget renderButtonContent() {
    return Text(
      widget.title,
      maxLines: 1,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: (widget.type == AppButtonType.primary)
            ? AppColors.white
            : AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: widget.onTap,
      child: Container(
        decoration: getButtonDecoration(),
        padding: (const EdgeInsets.symmetric(vertical: 11)),
        child: Center(
          child: renderButtonContent(),
        ),
      ),
    );
  }
}

enum AppButtonType {
  primary,
  secondary,
}
