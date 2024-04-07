import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/linkAPIs.dart';
import 'package:kiwi/view/widgets/home/customHomeTitle.dart';
import '../../controller/homePage_controller.dart';
import '../widgets/home/bannerCard.dart';
import '../widgets/home/customAppBar.dart';
import '../widgets/home/listOfCategories.dart';
import '../widgets/home/listOfNewItems.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controllerImp) => HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  titleAppBar: 'Search...',
                  onPressedSearch: () {},
                  onPressedNotification: () {},
                ),
                const BannerCard(
                  title: 'Friday Offers',
                  subTitle: 'Discount +40%',
                ),
                const CustomHomeTitle(title: "Categories"),
                const ListOfCategories(),
                const CustomHomeTitle(title: "New Meals"),
                const ListOfNewItems(),
                const CustomHomeTitle(title: "Top Seals"),
                const ListOfNewItems(),
              ],
            ),
          ),
        ),
      );
  }
}
