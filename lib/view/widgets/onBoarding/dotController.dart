import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onBoardingController.dart';
import '../../../core/constants/colors.dart';
import '../../../data/dataSource/static/onBoardingList.dart';

class DotController extends StatelessWidget {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 400),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: controller.currentPageIndex == index
                                ? AppColors.primaryColor
                                : Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
              ],
            ));
  }
}
