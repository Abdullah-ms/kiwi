import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/constants/colors.dart';

import '../../controller/homePage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 35,
                      ),
                      hintText: "find product ...",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                width: 60,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_on_outlined,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    "Spring Offers",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text(
                    "Discount 20%",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                right: -30,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(160),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}
