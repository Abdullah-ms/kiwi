import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/appRoutesNames.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constants/colors.dart';
import 'cartOrderButton.dart';
import 'customButtonCoupon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String price;

  final String discount;

  final String delivery;

  final String totalPrice;

  final TextEditingController controllerCoupon;

  final void Function()? onApplyCoupon;

  const CustomBottomNavigationBar(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalPrice,
      required this.controllerCoupon,
      this.onApplyCoupon,
      required this.delivery});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartControllerImp>(
              builder: (controller) => controller.couponName == null
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Save on your order", style: TextStyle(color: AppColors.secondaryColor , fontSize: 20 ),),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: controllerCoupon,
                                      decoration: const InputDecoration(
                                        hintText: "Enter voucher code",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 10),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: CustomButtonCoupon(
                                      textButton: 'Submit',
                                      onPressed: onApplyCoupon,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ),
                  )
                  : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "coupon \" ${controller.couponName!} \" was applied ",
                            style:
                                const TextStyle(color: Colors.green, fontSize: 16 ,fontWeight: FontWeight.bold),
                          ),
                        ),
                    ),
                  )),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Payment summery" , style: TextStyle(color: AppColors.secondaryColor , fontSize: 20 ),),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Subtotal",
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
                      child: Text(
                        "Coupon discount",
                        style: TextStyle(
                            fontSize: 15, color: AppColors.secondaryColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        discount,
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
                      child: Text(
                        "Delivery fee",
                        style: TextStyle(
                            fontSize: 15, color: AppColors.secondaryColor),
                      ),
                    ),
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
                        "Total amount",
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secondaryColor,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        totalPrice,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.green,
                            fontFamily: "sans"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
