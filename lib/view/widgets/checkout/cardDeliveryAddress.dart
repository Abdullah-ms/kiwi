import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CardDeliveryAddress extends StatelessWidget {
  final String title ;
  final String subtitle ;
  final bool isActive ;
  const CardDeliveryAddress({super.key, required this.title, required this.subtitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color : isActive ? AppColors.primaryColor : Colors.white ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
      child: ListTile(
        title: Text(title , style: TextStyle(color: isActive ? Colors.white : null , fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle, style: TextStyle(color: isActive ? Colors.white : null , fontWeight: FontWeight.bold),),
      ),
    );
  }
}
