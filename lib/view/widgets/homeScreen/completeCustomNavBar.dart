import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/homeScreenController.dart';

import '../../../core/constants/colors.dart';
import 'customButtonNavigationAppBar.dart';

class CompleteCustomNavBar extends StatelessWidget {
  const CompleteCustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) => BottomAppBar(
      color: AppColors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(controller.pagesList.length + 1, (index) {
            int newIndex = index > 2 ? index - 1 : index;
            return index == 2
                ? const Spacer()
                : CustomButtonNavigationAppBar(
              title: controller.iconsList[newIndex]['title'],
              onPressed: () {
                controller.changePage(newIndex);
              },
              icon: controller.iconsList[newIndex]['icon'],
              activeColor:
              controller.currentPage == newIndex ? true : false,
            );
          })
        ],
      ),
    ));
  }
}
