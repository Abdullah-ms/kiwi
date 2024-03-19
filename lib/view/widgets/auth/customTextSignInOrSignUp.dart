
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomTextSignInOrSignUp extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final Function()? onTap ;
  const CustomTextSignInOrSignUp({super.key, required this.textOne, required this.textTwo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style: TextStyle(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
