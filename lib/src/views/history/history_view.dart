import 'package:app_open/src/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final _controller = Get.put(HistoryController());

  HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Container(
              child: _controller.historyList.isEmpty
                  ? const Center(
                      child: Text("No history"),
                    )
                  : ListView.builder(
                      itemCount: _controller.historyList.length,
                      itemBuilder: (context, index) {
                        return Text(_controller.historyList[index].shortUrl ??
                            "Not Found");
                      },
                    ),
            ),
          ),
        ));
  }
}
