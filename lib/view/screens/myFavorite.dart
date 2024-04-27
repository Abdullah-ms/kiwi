import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/myFavoriteController.dart';
import '../../core/classes/handlingDataView.dart';
import '../../data/model/myFavoriteModel.dart';
import '../widgets/customAppBar.dart';
import '../widgets/myFavorite/customListMyFavoriteList.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
        // في حال ظهور حواف غير جميلة في حال عمل slide اخذف ال container واضف padding بشكل مباشر
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: 'Search...',
              onPressedSearch: () {},
              onPressedNotification: () {},
             // onPressedFavorite: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<MyFavoriteControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.myFavoriteList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (BuildContext context, index) {
                      return CustomMyFavoriteList(
                        myFavoriteModel: MyFavoriteModel.fromJson(
                            controller.myFavoriteList[index]),
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
