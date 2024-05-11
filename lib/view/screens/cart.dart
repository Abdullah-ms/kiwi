import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/cart_controller.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/data/model/cartModel.dart';
import '../../core/constants/appRoutesNames.dart';
import '../widgets/cart/cartOrderButton.dart';
import '../widgets/cart/customBottomNavigationBar.dart';
import '../widgets/cart/customButtonCoupon.dart';
import '../widgets/cart/customItemsCartList.dart';
import '../widgets/cart/topCardCart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controllerImp = Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart"
        ),
      ),
     /* bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controllerImp) => CustomBottomNavigationBar(
          price: "${controllerImp.priceOfAllMealsInCart} IDQ",
          discount: "${controllerImp.couponDiscountInitial}%",
          totalPrice: "${controllerImp.getTotalPrice()} IDQ",
          controllerCoupon: controllerImp.controllerCoupon,
          onApplyCoupon: () {
            controllerImp.checkCoupon();
          },
          delivery: '1000',
        ),
      ),*/
      body: GetBuilder<CartControllerImp>(
        builder: (controllerImp) => HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: ListView(
                    children: [
                      TopCardCart(
                        message:
                            'You have ${controllerImp.totalCountOfItemsInCart} items in your cart',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              controllerImp.carlList.length,
                              (index) => CustomItemsCartList(
                                cartModel:
                                    CartModel.fromJson(controllerImp.carlList[index]),
                                onAdd: () async {
                                  // دالتين يعملان بنفس الوقت ,,اذا يجب وضع async / await
                                  await controllerImp.addToCart(controllerImp
                                      .carlList[index]['items_id']
                                      .toString());
                                  controllerImp.refreshPage();
                                },
                                onRemove: () async {
                                  await controllerImp.deleteFromCart(controllerImp
                                      .carlList[index]['items_id']
                                      .toString());
                                  controllerImp.refreshPage();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      GetBuilder<CartControllerImp>(
                        builder: (controllerImp) => CustomBottomNavigationBar(
                          price: "${controllerImp.priceOfAllMealsInCart} IDQ",
                          discount: "${controllerImp.couponDiscountInitial}%",
                          totalPrice: "${controllerImp.getTotalPrice()} IDQ",
                          controllerCoupon: controllerImp.controllerCoupon,
                          onApplyCoupon: () {
                            controllerImp.checkCoupon();
                          },
                          delivery: '1000',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 50),
                    child: CustomButtonCart(
                      textButton: 'Checkout',
                      onPressed: () {
                        Get.toNamed(AppRoutes.checkOut);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
