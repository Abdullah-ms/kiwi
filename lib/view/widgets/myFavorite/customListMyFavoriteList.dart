import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/myFavoriteController.dart';
import 'package:kiwi/data/model/myFavoriteModel.dart';
import '../../../core/constants/assetsImages.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translateDatabase.dart';
import '../../../linkAPIs.dart';

class CustomMyFavoriteList extends GetView<MyFavoriteControllerImp> {
  final MyFavoriteModel myFavoriteModel;

  const CustomMyFavoriteList({
    super.key,
    required this.myFavoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // controller.goToProducts(myFavoriteModel);
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
                    tag: "${myFavoriteModel.itemsId}",
                    child: CachedNetworkImage(
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                      imageUrl: "${AppLinks.imagesItems}/${myFavoriteModel.itemsImages}",
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${translateDatabase(
                        myFavoriteModel.itemsName, myFavoriteModel.itemsNameAr)}",
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
                                (index) =>
                                Icon(
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
                          if(myFavoriteModel.itemsDiscount !=0 ) Text(
                            "${myFavoriteModel.itemsPrice}",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black38, decorationThickness: 4.0,
                                color: AppColors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans"),
                          ),
                          Text(
                            "${myFavoriteModel.priceAfterDiscount}",
                            style: TextStyle(
                                color: myFavoriteModel.itemsDiscount ==0 ? AppColors.secondaryColor : AppColors.green ,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans"),
                          ),
                        ],
                      ),
                      IconButton(onPressed: (){
                        controller.deleteFromMyFavorite(myFavoriteModel.favoriteId!);
                      }, icon: const Icon(Icons.remove_circle_outline_rounded),
                        color: AppColors.primaryColor,)
                    ],
                  )
                ],
              ),
            ),
            if(myFavoriteModel.itemsDiscount !=0 ) Positioned(
                top: -10,
                child: Column(
                  children: [
                    Image.asset(MyImages.discount , width: 40),
                    Text("${myFavoriteModel.itemsDiscount} %",style: TextStyle( color: AppColors.green, fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
