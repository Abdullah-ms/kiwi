import 'package:flutter/material.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import 'package:kiwi/core/constants/colors.dart';
import 'package:lottie/lottie.dart';

import '../constants/assetsImages.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;

  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Center(
              child: Lottie.asset(MyImages.loading, height: 250, width: 250),
            ),
          )
        : statusRequest == StatusRequest.offline
            ? const Center(
                child: Text('offline : Check WiFi'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child:
                        Lottie.asset(MyImages.server, height: 250, width: 250),
                  )
                : statusRequest == StatusRequest.noData
                    ? Center(
                        child: Lottie.asset(MyImages.noData,
                            height: 250, width: 250),
                      )
                    : widget;
  }
}
