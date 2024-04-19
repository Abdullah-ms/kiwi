import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/productsController.dart';
import '../../../core/constants/colors.dart';

class SubItemsList extends GetView<ProductControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItemsList.length,
              (index) => Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subItemsList[index]['active'] == 1
                    ? AppColors.secondaryColor
                    : AppColors.white,
                border:
                Border.all(color: AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.subItemsList[index]['name']}",
              style: TextStyle(
                  color:
                  controller.subItemsList[index]['active'] == 1
                      ? AppColors.white
                      : AppColors.secondaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
