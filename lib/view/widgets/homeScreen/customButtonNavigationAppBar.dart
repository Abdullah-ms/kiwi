import 'package:flutter/material.dart';
import 'package:kiwi/core/constants/colors.dart';

class CustomButtonNavigationAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final bool? activeColor;

  const CustomButtonNavigationAppBar(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: activeColor == true ? AppColors.forthColor : AppColors.white,
      ),
    );
  }
}
