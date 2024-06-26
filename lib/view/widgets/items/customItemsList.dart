import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/itemsController.dart';
import 'package:kiwi/data/model/itemsModel.dart';
import '../../../controller/favorite_controller.dart';
import '../../../core/constants/assetsImages.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translateDatabase.dart';
import '../../../linkAPIs.dart';

class CustomItemsList extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomItemsList({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProducts(itemsModel);
      },
      child: Card(
        child: Stack(
          clipBehavior: Clip.none,
         children: [
           Padding(
             padding: const EdgeInsets.all(10),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Hero(
                   tag: "${itemsModel.itemsId}",
                   child: CachedNetworkImage(
                     height: 80,
                     width: 80,
                     fit: BoxFit.fill,
                     imageUrl: "${AppLinks.imagesItems}/${itemsModel.itemsImages}",
                     placeholder: (context, url) =>
                     const CircularProgressIndicator(),
                     errorWidget: (context, url, error) => const Icon(Icons.error),
                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 Text(
                   "${translateDatabase(itemsModel.itemsName, itemsModel.itemsNameAr)}",
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
                     Column(
                       children: [
                         if(itemsModel.itemsDiscount !=0 ) Text(
                           "${itemsModel.itemsPrice}",
                           style: TextStyle(
                               decoration: TextDecoration.lineThrough,
                               decorationColor: Colors.black38, decorationThickness: 4.0,
                               color: AppColors.red,
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               fontFamily: "sans"),
                         ),
                         Text(
                           "${itemsModel.priceAfterDiscount}",
                           style: TextStyle(
                               color: itemsModel.itemsDiscount ==0 ? AppColors.secondaryColor : AppColors.green ,
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               fontFamily: "sans"),
                         ),
                       ],
                     ),
                     GetBuilder<FavoriteControllerImp>(
                       builder: (favController) => IconButton(
                         onPressed: () {
                           if (favController.isFavorite[itemsModel.itemsId] == 1) {
                             favController.setFavorite(itemsModel.itemsId, 0);
                             favController
                                 .removeFavorite(itemsModel.itemsId.toString());
                           } else {
                             favController.setFavorite(itemsModel.itemsId, 1);
                             favController
                                 .addFavorite(itemsModel.itemsId.toString());
                           }
                         },
                         icon: Icon(
                           favController.isFavorite[itemsModel.itemsId] == 1
                               ? Icons.favorite
                               : Icons.favorite_border_outlined,
                           color: AppColors.primaryColor,
                         ),
                       ),
                     )
                   ],
                 )
               ],
             ),
           ),
          if(itemsModel.itemsDiscount !=0 ) Positioned(
               top: -10,
               child: Column(
                 children: [
                   Image.asset(MyImages.discount , width: 40),
                   Text("${itemsModel.itemsDiscount} %",style: TextStyle( color: AppColors.green, fontSize: 16,
                       fontWeight: FontWeight.bold,
                       fontFamily: "sans"),)
                 ],
               )),]
        ),
      ),
    );
  }
}
