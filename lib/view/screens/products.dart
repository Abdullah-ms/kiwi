
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/productsController.dart';
import 'package:kiwi/core/constants/colors.dart';
import 'package:kiwi/core/functions/translateDatabase.dart';
import '../widgets/products/price_and_count.dart';
import '../widgets/products/subItemsList.dart';
import '../widgets/products/topProductStackDetails.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.secondaryColor,
          onPressed: () {},
          child: Text(
            "Add To Cart",
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopProductStackDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${translateDatabase(controller.itemsModel.itemsName, controller.itemsModel.itemsNameAr)}",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.secondaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                PriceAndCountOfProduct(
                  onAdd: () {},
                  onRemove: () {},
                  count: '2',
                  price: '${controller.itemsModel.itemsPrice}',
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${translateDatabase(controller.itemsModel.itemsDesc, controller.itemsModel.itemsDescAr)}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blackIntermediate),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "sauce",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.secondaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SubItemsList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
