import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/itemsController.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/data/model/itemsModel.dart';
import '../../../core/constants/colors.dart';
import '../../../linkAPIs.dart';

class CustomItemsList extends StatelessWidget {
  final ItemsModel itemsModel;

  const CustomItemsList({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: 80,
                width: 80,
                fit: BoxFit.fill,
                imageUrl: "${AppLinks.imagesItems}/${itemsModel.itemsImages}",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${itemsModel.itemsName}",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 18,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
