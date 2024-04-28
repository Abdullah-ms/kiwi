import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomItemsCartList extends StatelessWidget {
  final String itemName ;
  final String itemPrice ;
  final String itemCount ;

  const CustomItemsCartList({super.key, required this.itemName, required this.itemPrice, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/logo.png",
                height: 90,
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(itemName),
                subtitle: Text(
                  itemPrice,
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
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      itemCount,
                      style: const TextStyle(fontFamily: "sans"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: IconButton(
                      onPressed: () {},
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
