import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomHomeTitle extends StatelessWidget {
  final String title ;
  const CustomHomeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
