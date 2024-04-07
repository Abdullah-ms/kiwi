import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/homePage_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/categoriesModel.dart';
import '../../../linkAPIs.dart';

class ListOfCategories extends GetView<HomeControllerImp> {
  const ListOfCategories({super.key});

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
            categoriesModel:
                CategoriesModel.fromJson(controller.dataCategories[index]),
          );
        },
      ),
    );
  }
}

class CategoriesUsingModel extends StatelessWidget {
  final CategoriesModel categoriesModel;

  const CategoriesUsingModel({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
