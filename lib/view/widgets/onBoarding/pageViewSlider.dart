import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onBoardingController.dart';
import '../../../core/constants/colors.dart';
import '../../../data/dataSource/static/onBoardingList.dart';

class PageViewSlider extends GetView<OnBoardingControllerImp> {
  const PageViewSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          return ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    onBoardingList[i].image,
                    height: Get.width/1.3,
                   // width: 230,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    onBoardingList[i].title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 2, color: AppColors.blackIntermediate, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          );
        });
  }
}
