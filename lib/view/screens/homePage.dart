import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/view/widgets/home/customHomeTitle.dart';
import '../../controller/homePage_controller.dart';
import '../widgets/home/bannerCard.dart';
import '../widgets/customAppBar.dart';
import '../widgets/home/ListOfHomePageCategories.dart';
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
                const ListOfHomePageCategories(),
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
