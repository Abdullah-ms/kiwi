import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';
import 'package:kiwi/core/services/services.dart';
import '../data/dataSource/static/onBoardingList.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
  skip();
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPageIndex = 0;

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  @override
  next() {
    currentPageIndex++;
    if (currentPageIndex > onBoardingList.length - 1) {
     myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPageIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPageIndex = index;
    update();
  }

  @override
  skip() {
    currentPageIndex = 3 ;
    if (currentPageIndex == 3) {
      myServices.sharedPreferences.setString("obBoarding", "1");
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }


}
