import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/homeScreenController.dart';
import 'package:kiwi/core/constants/colors.dart';
import '../widgets/homeScreen/completeCustomNavBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // لا تضيف const لل CompleteCustomNavBar لانه سيمنع تحديث الui وبالتالب لا يتغير لون الicon او يمكنك عمله مع اضافة GetBuilder عند انشائه
        bottomNavigationBar: const CompleteCustomNavBar(),
        body: controller.pagesList.elementAt(controller.currentPage),
      ),
    );
  }
}
