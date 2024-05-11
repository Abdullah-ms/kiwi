import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/core/constants/colors.dart';

import '../../../core/constants/assetsImages.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: AppColors.primaryColor,
      child: SvgPicture.asset(MyImages.logo , height: 70,width: 70,color: Colors.white,)
    );
  }
}
