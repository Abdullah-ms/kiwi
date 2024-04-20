import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/itemsController.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/data/model/itemsModel.dart';
import 'package:kiwi/linkAPIs.dart';
import 'package:kiwi/view/widgets/customAppBar.dart';
import '../../controller/favorite_controller.dart';
import '../../core/constants/colors.dart';
import '../widgets/items/ListOfItemsPageCategories.dart';
import '../widgets/items/customItemsList.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp favoriteControllerImp = Get.put(
        FavoriteControllerImp());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: 'Search...',
              onPressedSearch: () {},
              onPressedNotification: () {}, onPressedFavorite: () {  },
            ),
            const SizedBox(
              height: 20,
            ),
            const ListOfItemsPageCategories(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) =>
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.itemsList.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          favoriteControllerImp.isFavorite[controller
                              .itemsList[index]["items_id"]] =
                          controller.itemsList[index]["favorite"] ;
                          return CustomItemsList(
                          itemsModel:
                          ItemsModel.fromJson(controller.itemsList[index]),
                          );
                          }),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
