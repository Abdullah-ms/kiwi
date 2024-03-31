import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/controller/test_controller.dart';
import 'package:kiwi/core/constants/colors.dart';
import 'package:kiwi/core/functions/checkInternet.dart';
import '../core/classes/handlingDataView.dart';

class TestView extends StatefulWidget {
   const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {

  var res ;

  intialData()async {
    res = await checkInternet();
    print(res);
  }

   @override
  void initState() {
     intialData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Get.put(TestControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("page title",style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<TestControllerImp>(builder: (controllerImp) {
        return HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: ListView.builder(
              itemCount: controllerImp.data.length,
              itemBuilder: (context, index) {
                return Text("${controllerImp.data}");
              }),
        );
      }),
    );
  }
}
