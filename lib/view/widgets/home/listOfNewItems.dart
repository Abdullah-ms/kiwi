import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homePage_controller.dart';
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
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLinks.imagesItems}/${itemsModel.itemsImages}",
            height: 90,
            width: 140,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 140,
          width: 190,
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          left: 10,
          child: Text(
            "${itemsModel.itemsName}",
            style: TextStyle(
                color: AppColors.blackIntermediate,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
