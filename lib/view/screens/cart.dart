import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/cart_controller.dart';
import 'package:kiwi/core/classes/handlingDataView.dart';
import 'package:kiwi/data/model/cartModel.dart';
import '../../data/model/itemsModel.dart';
import '../widgets/cart/customBottomNavigationBar.dart';
import '../widgets/cart/customItemsCartList.dart';
import '../widgets/cart/topAppBarCart.dart';
import '../widgets/cart/topCardCart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controllerImp = Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controllerImp) => CustomBottomNavigationBar(
          price: '${controllerImp.priceOfAllMealsInCart} IDQ',
          delivery: '1000',
          totalPrice: '0000.00',
        ),
      ),
      body: GetBuilder<CartControllerImp>(
        builder: (controllerImp) => HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: Container(
            child: ListView(
              children: [
                const TopAppBarCart(
                  title: 'My Cart',
                ),
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
                            await controllerImp.addToCart(
                                controllerImp.carlList[index]['items_id'].toString());
                            controllerImp.refreshPage();
                          },
                          onRemove: () async {
                            await controllerImp.deleteFromCart(
                                controllerImp.carlList[index]['items_id'].toString());
                            controllerImp.refreshPage();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
