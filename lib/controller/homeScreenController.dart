import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/view/screens/homePage.dart';

import '../view/screens/myFavorite.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int indexOfPage);
}

class HomeScreenControllerImp extends HomeScreenController{

  int currentPage = 0 ;

  List<Widget> pagesList =[
    const HomePage(),
    const MyFavorite(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("orders"),)],),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("profile"),)],),
  ];

  List iconsList =[
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.fastfood_outlined,
    Icons.person_outline,
  ];


  @override
  changePage(int indexOfPage) {
    currentPage = indexOfPage;
    update();
  }


}