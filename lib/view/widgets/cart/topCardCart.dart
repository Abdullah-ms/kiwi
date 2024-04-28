import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class TopCardCart extends StatelessWidget {
  final String message ;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Text(
          message,
          style:
          TextStyle(color: AppColors.secondaryColor, fontSize: 17),
        ),
      ),
    );
  }
}
