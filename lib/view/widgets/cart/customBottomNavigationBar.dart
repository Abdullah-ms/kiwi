import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import 'cartOrderButton.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String price ;
  final String delivery ;
  final String totalPrice ;

  const CustomBottomNavigationBar({super.key, required this.price, required this.delivery, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Meal",
                    style: TextStyle(
                        fontSize: 15, color: AppColors.secondaryColor),
                  )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  price,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.secondaryColor,
                      fontFamily: "sans"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Delivery",
                      style: TextStyle(
                          fontSize: 15, color: AppColors.secondaryColor))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  delivery,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.secondaryColor,
                      fontFamily: "sans"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.secondaryColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Total Price",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  totalPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.red,
                      fontFamily: "sans"),
                ),
              ),
            ],
          ),
          CustomButtonCart(
            textButton: 'Complete Order',
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
