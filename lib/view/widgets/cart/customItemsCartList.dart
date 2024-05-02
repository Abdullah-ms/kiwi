import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/cartModel.dart';
import '../../../linkAPIs.dart';

class CustomItemsCartList extends StatelessWidget {
  final CartModel cartModel ;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({super.key, required this.cartModel, required this.onAdd, required this.onRemove});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: AppColors.primaryColor,
                child: CachedNetworkImage(
                  height: 60,
                  width: 50,
                  fit: BoxFit.cover,
                  imageUrl: "${AppLinks.imagesItems}/${cartModel.itemsImages}",
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
        ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text("${cartModel.itemsName}"),
                subtitle: Text(
                  "${cartModel.itemsPriceForItemAfterCount}",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.red,
                      fontFamily: "sans"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: IconButton(
                      color: AppColors.primaryColor,
                      onPressed: onAdd,
                      icon: const Icon(Icons.add_box),
                    ),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "${cartModel.countitems}",
                      style: const TextStyle(fontFamily: "sans"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: IconButton(
                      onPressed: onRemove,
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
