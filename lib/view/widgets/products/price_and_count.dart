import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class PriceAndCountOfProduct extends StatelessWidget {
  final void Function() onAdd;

  final void Function() onRemove;

  final String count;

  final String price;

  const PriceAndCountOfProduct(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                count,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price IDQ",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primaryColor, fontSize: 20),
        ),
      ],
    );
  }
}
