import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/view/widgets/onBoarding/customButtonOnBoarding.dart';
import 'package:kiwi/view/widgets/onBoarding/dotController.dart';
import 'package:kiwi/view/widgets/onBoarding/pageViewSlider.dart';
import '../../controller/onBoardingController.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageViewSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotController(),
                  Spacer(
                    flex: 1,
                  ),
                  CustomButtonOnBoarding()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
