import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/homePage_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/categoriesModel.dart';
import '../../../linkAPIs.dart';

class ListOfHomePageCategories extends GetView<HomeControllerImp> {
  const ListOfHomePageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.dataCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesUsingModel(
            i : index ,
            categoriesModel:
                CategoriesModel.fromJson(controller.dataCategories[index]),
          );
        },
      ),
    );
  }
}

class CategoriesUsingModel extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i ;
  const CategoriesUsingModel({super.key, required this.categoriesModel , required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.dataCategories, i!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLinks.imagesCategories}/${categoriesModel.categoriesImage}",
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            "${categoriesModel.categoriesName}",
            style: TextStyle(color: AppColors.blackIntermediate, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
