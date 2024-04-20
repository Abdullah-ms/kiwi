import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/data/model/myFavoriteModel.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translateDatabase.dart';
import '../../../linkAPIs.dart';

class CustomMyFavoriteList extends StatelessWidget {
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
        child: Padding(
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
                  Text(
                    "${myFavoriteModel.itemsPrice}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  /*GetBuilder<FavoriteControllerImp>(
                    builder: (favController) =>
                        IconButton(
                          onPressed: () {
                            if (favController.isFavorite[myFavoriteModel.itemsId] ==
                                1) {
                              favController.setFavorite(myFavoriteModel.itemsId, 0);
                              favController.removeFavorite(myFavoriteModel.itemsId.toString());
                            } else {
                              favController.setFavorite(myFavoriteModel.itemsId, 1);
                              favController.addFavorite(myFavoriteModel.itemsId.toString());
                            }
                          },
                          icon: Icon(
                            favController.isFavorite[myFavoriteModel.itemsId] == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColors.primaryColor,
                          ),),)*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
