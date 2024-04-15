import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/itemsController.dart';
import 'package:kiwi/linkAPIs.dart';
import 'package:kiwi/view/widgets/customAppBar.dart';
import '../../core/constants/colors.dart';
import '../widgets/items/ListOfItemsPageCategories.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: 'Search...',
              onPressedSearch: () {},
              onPressedNotification: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const ListOfItemsPageCategories(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                    child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: AppLinks.imagesItems + "/burger_cheese.png",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Text(
                          "Cheese Burger",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Description of Cheese Burger item",
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "6500 IQD",
                              style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans"),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined))
                          ],
                        )
                      ],
                    ),
                  ),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
