import 'package:flutter/material.dart';
import 'package:kiwi/core/constants/colors.dart';

import '../../../core/constants/assetsImages.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: AppColors.primaryColor,
      child: Image.asset(
        MyImages.toot,
      ),
    );
  }
}
