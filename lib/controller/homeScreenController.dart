import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/view/screens/homePage.dart';
import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int indexOfPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("categories"),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("orders"),
        )
      ],
    ),
    Settings(),
  ];

  List iconsList = [
    {
      //"title": "Home",
      "icon": Icons.home_outlined,
    },
    {
      //"title": "Categories",
      "icon": Icons.category_outlined,
    },
    {
      //"title": "Orders",
      "icon": Icons.fastfood_outlined,
    },
    {
      //"title": "Setting",
      "icon": Icons.person_outline,
    },
  ];

  @override
  changePage(int indexOfPage) {
    currentPage = indexOfPage;
    update();
  }
}
