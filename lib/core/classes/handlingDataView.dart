import 'package:flutter/material.dart';
import 'package:kiwi/core/classes/statusRequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;

  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: Text('loading'),
          )
        : statusRequest == StatusRequest.offline
            ? const Center(
                child: Text('offline failure'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? const Center(
                    child: Text('server failure ERROR 404'),
                  )
                : statusRequest == StatusRequest.noData
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : widget;
  }
}
