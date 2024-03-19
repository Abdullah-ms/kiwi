import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomAuthButton extends StatelessWidget {
  final String textButton ; 
  final void Function()? onPressed ;
  const CustomAuthButton({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      color: AppColors.primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        textButton,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.symmetric(vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
