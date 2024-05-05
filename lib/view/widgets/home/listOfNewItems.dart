import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homePage_controller.dart';
import '../../../core/constants/assetsImages.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/itemsModel.dart';
import '../../../linkAPIs.dart';

class ListOfNewItems extends GetView<HomeControllerImp> {
  const ListOfNewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          itemCount: controller.dataItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsUsingModel(
              itemsModel: ItemsModel.fromJson(controller.dataItems[index]),
            );
          }),
    );
  }
}

class ItemsUsingModel extends StatelessWidget {
  final ItemsModel itemsModel;

  const ItemsUsingModel({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 170,
              width: 180,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Image.network(
                    "${AppLinks.imagesItems}/${itemsModel.itemsImages}",
                    height: 60,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  // color: AppColors.primaryColor.withOpacity(0.1),
                  border: Border.all(color: AppColors.primaryColor, width: 1 ),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Positioned(
              left: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${itemsModel.itemsName}",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 17,),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                child: Row(children: [
              Image.asset(MyImages.discount , width: 50),
              Text("${itemsModel.itemsDiscount} %",style: TextStyle( color: AppColors.green, fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "sans"),)
            ],))
          ],
        ),
        const SizedBox(width: 10 ,)
      ],
    )
    ;
  }
}
