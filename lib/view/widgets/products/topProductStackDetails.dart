import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/productsController.dart';
import '../../../core/constants/colors.dart';
import '../../../linkAPIs.dart';

class TopProductStackDetails extends GetView<ProductControllerImp> {
  const TopProductStackDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.thirdColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              height: 250,
              fit: BoxFit.fill,
              imageUrl:
              "${AppLinks.imagesItems}/${controller.itemsModel.itemsImages}",
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
