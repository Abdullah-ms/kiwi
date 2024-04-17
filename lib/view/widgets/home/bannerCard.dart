 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/homePage_controller.dart';
import '../../../core/constants/colors.dart';
class BannerCard extends GetView<HomeControllerImp> {
  final String title ;
  final String subTitle ;
  const BannerCard({super.key, required this.title, required this.subTitle});

   @override
   Widget build(BuildContext context) {
     return Container(
       margin: const EdgeInsets.symmetric(vertical: 15),
       child: Stack(
         children: [
           Container(
             alignment: Alignment.center,
             height: 150,
             decoration: BoxDecoration(
               color: AppColors.primaryColor,
               borderRadius: BorderRadius.circular(20),
             ),
             child: ListTile(
               title: Text(
                 title,
                 style: const TextStyle(color: Colors.white, fontSize: 20),
               ),
               subtitle: Text(
                 subTitle,
                 style: const TextStyle(color: Colors.white, fontSize: 30),
               ),
             ),
           ),
           Positioned(
             bottom: -50,
             right: controller.lang == "en" ? -50 : null,
             left: controller.lang == "ar" ? -50 : null,
             child: Container(
               height: 160,
               width: 160,
               decoration: BoxDecoration(
                 // color: AppColors.forthColor,
                 borderRadius: BorderRadius.circular(160),
               ),
               child: Image.asset("assets/images/logo.png"),
             ),
           ),
         ],
       ),
     );
   }
 }
