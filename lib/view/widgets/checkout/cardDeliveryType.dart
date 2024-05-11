import 'package:flutter/material.dart';
import '../../../core/constants/assetsImages.dart';
import '../../../core/constants/colors.dart';

class CardDeliveryType extends StatelessWidget {
  final String title;

  final bool isActive;

  final String imageName;

  const CardDeliveryType(
      {super.key,
      required this.title,
      required this.isActive,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : null,
          border: Border.all(color: AppColors.primaryColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 60,
            color: isActive ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : AppColors.primaryColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
