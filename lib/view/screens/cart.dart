import 'package:flutter/material.dart';
import '../widgets/cart/customBottomNavigationBar.dart';
import '../widgets/cart/customItemsCartList.dart';
import '../widgets/cart/topAppBarCart.dart';
import '../widgets/cart/topCardCart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        price: '8000',
        delivery: '1000',
        totalPrice: '9000',
      ),
      body: Container(
        child: ListView(
          children: [
            TopAppBarCart(
              title: 'My Cart',
            ),
            TopCardCart(
              message: 'You have 2 items in your cart',
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomItemsCartList(
                    itemName: 'Cheese Burger',
                    itemPrice: '7000',
                    itemCount: '3',
                  ),
                  CustomItemsCartList(
                    itemName: 'Rezo',
                    itemPrice: '5000',
                    itemCount: '1',
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
