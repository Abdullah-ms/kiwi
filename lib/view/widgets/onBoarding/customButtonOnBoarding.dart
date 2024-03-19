import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onBoardingController.dart';
import '../../../core/constants/colors.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          MaterialButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              onPressed: () {
                controller.next();
              },
              color: AppColors.primaryColor,
              textColor: Colors.white,
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20),
              )),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                  onPressed: () {
                    controller.skip();
                  },
                  child: Text(
                    "Skip",
                    style:
                        TextStyle(fontSize: 20, color: AppColors.primaryColor),
                  )))
        ],
      ),
    );
  }
}
