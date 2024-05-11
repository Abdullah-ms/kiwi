import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/localization/changeLocal.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;

  const CustomButtonCoupon({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangController>(
        builder: (controller) => Container(
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: MaterialButton(
            color: AppColors.primaryColor,
            textColor: Colors.white,
            onPressed: onPressed,
            child: Text(
              textButton,
              style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 17),
            ),
          ),
        ));
  }
}
