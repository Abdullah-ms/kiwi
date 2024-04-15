import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/itemsController.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/categoriesModel.dart';

class ListOfItemsPageCategories extends GetView<ItemsControllerImp> {
  const ListOfItemsPageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 15,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesUsingModel(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class CategoriesUsingModel extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const CategoriesUsingModel(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         controller.changeCat(i!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
            decoration: i == controller.selectedCat
                ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: AppColors.forthColor,
                ),
              ),
            )
                : null,
            child: Text(
              "${categoriesModel.categoriesName}",
              style: TextStyle(color: AppColors.secondaryColor, fontSize: 20),
            ),
          ),),
        ],
      ),
    );
  }
}
