import 'package:flutter/material.dart';
import 'package:kiwi/core/constants/colors.dart';

class CustomButtonNavigationAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final bool? activeColor;
  final String? title ;

  const CustomButtonNavigationAppBar(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.activeColor, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: activeColor == true ? AppColors.primaryColor : AppColors.grey,
          ),
          Text("$title" , style: TextStyle(color: activeColor == true ? AppColors.primaryColor : AppColors.grey,),),
        ],
      ),
    );
  }
}
